import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _selectedLocation = null;
  void _save() {}

  void _selectLocation(LatLng argument) {}

  @override
  Widget build(BuildContext context) {
    LocationData _locationData =
        ModalRoute.of(context)?.settings.arguments as LocationData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a location'),
        actions: [IconButton(onPressed: _save, icon: Icon(Icons.save))],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(
              _locationData.latitude!,
              _locationData.longitude!,
            ),
            zoom: 16),
        onTap: _selectLocation,
        markers: {
          Marker(
            markerId: MarkerId("mrkId_1"),
            position: _selectedLocation == null
                ? LatLng(_locationData.latitude!, _locationData.longitude!)
                : _selectedLocation!,
          ),
        },
        mapType: MapType.normal,
      ),
    );
  }
}
