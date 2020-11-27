import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';

class ARObject extends StatefulWidget {
  @override
  _ARObjectState createState() => _ARObjectState();
}

class _ARObjectState extends State<ARObject> {
  ArCoreController arCoreController;

  String objectSelected;

  @override
  Widget build(BuildContext context) {
    return ArCoreView(
      onArCoreViewCreated: _onArCoreViewCreated,
      enableTapRecognizer: true,
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onNodeTap = (name) => onTapHandler(name);
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  void _addToucano(ArCoreHitTestResult plane) {
    final toucanNode = ArCoreReferenceNode(
        name: "Toucano",
        objectUrl:
            // "https://github.com/HellBus1/Flutter-AR/blob/main/sampledata/indoor_pot_plant_3/scene.gltf",
            "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF/Duck.gltf",
        position: plane.pose.translation,
        rotation: plane.pose.rotation);

    arCoreController.addArCoreNodeWithAnchor(toucanNode);
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    _addToucano(hit);
  }

  void onTapHandler(String name) {
    print("Flutter: onNodeTap");
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Row(
          children: <Widget>[
            Text('Remove $name?'),
            IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: () {
                  arCoreController.removeNode(nodeName: name);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
