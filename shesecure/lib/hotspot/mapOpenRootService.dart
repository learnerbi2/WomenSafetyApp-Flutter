import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class OpenRootMap extends StatefulWidget {
  final List<Map<String, double>> points;

  const OpenRootMap({super.key, required this.points});
      
  @override
  State<OpenRootMap> createState() => _OpenRootMapState();
}

class _OpenRootMapState extends State<OpenRootMap> {
  LatLng? currentLocation;
  List<Map<String, double>> allHotspots = [
  {"lat": 23.172035, "lng": 77.322906},//rbr hotel
  {"lat": 23.171888, "lng": 77.322922},//Kirana shop
  {"lat": 23.2454, "lng": 77.4744}, // Near Railway Station
  {"lat": 23.2334, "lng": 77.4505}, // New Market late night zone
  {"lat": 23.2265, "lng": 77.4033}, // Jahangirabad (past incident spot)
  {"lat": 23.2178, "lng": 77.4184}, // MP Nagar Zone-II
     ];
  List<Map<String, double>> nearbyHotspots = [];
  final double hotspotRadius = 500; // in meters
  
  @override
  void initState() {
    super.initState();
    _loadCurrentLocation();
  }

  
  Future<void> _loadCurrentLocation() async {
    try {
      var status = await Permission.location.request();
      if (status.isGranted) {
        final pos = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
     
     LatLng userLoc=LatLng(pos.latitude,pos.longitude);

        setState(() {
          currentLocation = LatLng(pos.latitude, pos.longitude);
          nearbyHotspots = getNearbyHotspots(userLoc);
        });
        if (nearbyHotspots.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("⚠️ ${nearbyHotspots.length} hotspot(s) near your location!"),
        backgroundColor: Colors.red,
        ));
}

      }
    } catch (e) {
      print("Location error: $e");
    }
  }

// indentify hotspot
  List<Map<String, double>> getNearbyHotspots(LatLng userLoc) {
  return allHotspots.where((point) {
    double distance = Geolocator.distanceBetween(
      userLoc.latitude,
      userLoc.longitude,
      point["lat"]!,
      point["lng"]!,
    );
    return distance <= 300;
  }).toList();
  
}


  @override
  Widget build(BuildContext context) {
    if (currentLocation == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Tracking Hotspots')),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: currentLocation!,
          initialZoom: 14.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
               // Hotspot markers
              ...nearbyHotspots.map((point) => Marker(
              point: LatLng(point['lat']!, point['lng']!),
              width: 40,
              height: 40,
              child: const Icon(Icons.warning, color: Colors.red, size: 30),
    )),

              //original points
               ...widget.points.map((point) => Marker(
                    point: LatLng(point['lat']!, point['lng']!),
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 40,
                    ),
                  )),

              //user location
              Marker(
                point: currentLocation!,
                width: 40,
                height: 40,
                child: const Icon(
                  Icons.my_location_sharp,
                  size: 40,
                  color: Colors.blue,
                ),
              ),
            ],
          ),


          CircleLayer(
            circles: [
              CircleMarker(
                point: currentLocation!,
                color: Colors.blueGrey.withOpacity(0.2),
                borderStrokeWidth: 2.0,
                borderColor: Colors.purpleAccent,
                radius: 300, // radius in meters
              ),
            ],
          ),
        ],
      ),
    );
  }
}
