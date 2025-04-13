import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Maps Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final Set<Marker> _markers = {}; // Set of markers for map
  final LatLng _initialPosition = LatLng(37.7749, -122.4194); // San Francisco

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps in Flutter'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        markers: _markers,
        onTap: (LatLng position) {
          setState(() {
            // Add a marker when the user taps on the map
            _markers.add(Marker(
              markerId: MarkerId(position.toString()),
              position: position,
              infoWindow: const InfoWindow(title: 'Custom Marker'),
            ));
          });
        },
      ),
    );
  }
}
