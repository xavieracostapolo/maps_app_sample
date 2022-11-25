import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _mapController = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
        body: GoogleMap(
            initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
            onMapCreated: (controller) => _mapController.complete(controller)));
  }

  @override
  Future<void> dispose() async {
    final GoogleMapController controller = await _mapController.future;
    controller.dispose();
    super.dispose();
  }
}
