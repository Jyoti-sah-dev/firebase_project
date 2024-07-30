// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
//
//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   final List<Marker> markarList = [];
//   int _markerIdCounter = 1;
//   void _addMarker(LatLng position) {
//     final String markerIdVal = '$_markerIdCounter';
//     _markerIdCounter++;
//     final Marker marker = Marker(
//       markerId: MarkerId(markerIdVal),
//       position: position,
//       infoWindow: InfoWindow(
//         title: 'My position',
//       ),
//       onTap: () {
//         print('$markerIdVal clicked');
//       },
//     );
//     setState(() {
//       markarList.add(marker);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final bool canDrawPolygon = markarList.length >= 1;
//     final Set<Polygon> polygons = canDrawPolygon
//         ? {
//       Polygon(
//         polygonId: PolygonId('polygon_1'),
//         points: markarList.map((marker) => marker.position).toList(),
//         strokeWidth: 2,
//         strokeColor: Colors.teal,
//         fillColor: Colors.purple.withOpacity(0.15),
//       ),
//     }
//         : {};
//
//     return Scaffold(
//
//
//       body: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: _kGooglePlex,
//         markers: Set<Marker>.of(markarList),
//         polygons: polygons,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//         onTap: (LatLng position) {
//           _addMarker(position);
//         },
//       ),
//     );
//   }
// }
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart'; // Import location package for accessing device location
//
// class MapSample extends StatefulWidget {
//   const MapSample({Key? key}) : super(key: key);
//
//   @override
//   State<MapSample> createState() => MapSampleState();
// }
//
// class MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller =
//   Completer<GoogleMapController>();
//
//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   late GoogleMapController mapController;
//   late LocationData currentLocation;
//   late Location location;
//
//   @override
//   void initState() {
//     super.initState();
//     location = Location(); // Initialize location service
//     initLocation(); // Fetch initial location
//   }
//
//   void initLocation() async {
//     try {
//       var userLocation = await location.getLocation(); // Get current location
//       setState(() {
//         currentLocation = userLocation; // Set current location state
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: GoogleMap(
//           mapType: MapType.normal,
//           initialCameraPosition: _kGooglePlex,
//           myLocationButtonEnabled: true, // Show button for user's current location
//           myLocationEnabled: true, // Show user's current location on the map
//           markers: Set<Marker>.of([
//             setMarker(), // Add your custom markers here if needed
//           ]),
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//             mapController = controller;
//           },
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: FloatingActionButton.extended(
//           onPressed: _goToTheLake,
//           label: const Text('To the lake!'),
//           icon: const Icon(Icons.directions_boat),
//         ),
//       ),
//     );
//   }
//
//   Marker setMarker() {
//     return Marker(
//       markerId: MarkerId("Maker_1"),
//       icon: BitmapDescriptor.defaultMarker,
//       position: LatLng(37.43296265331129, -122.08832357078792),
//     );
//   }
//
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
//
//   static const CameraPosition _kLake = CameraPosition(
//     bearing: 192.8334901395799,
//     target: LatLng(37.43296265331129, -122.08832357078792),
//     tilt: 59.440717697143555,
//     zoom: 19.151926040649414,
//   );
// }




import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final List<Marker> markarList = [];
  int _markerIdCounter = 1;
  LocationData? _currentLocation;
  late Location _location;

  @override
  void initState() {
    super.initState();
    _location = Location();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentLocation = await _location.getLocation();

    _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentLocation = currentLocation;
      });
      _updateCameraPosition();
    });
  }

  Future<void> _updateCameraPosition() async {
    if (_currentLocation != null) {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
        zoom: 14.4746,
      )));
    }
  }

  void _addMarker(LatLng position) {
    final String markerIdVal = '$_markerIdCounter';
    _markerIdCounter++;
    final Marker marker = Marker(
      markerId: MarkerId(markerIdVal),
      position: position,
      infoWindow: const InfoWindow(
        title: 'My position',
      ),
      onTap: () {
        print('$markerIdVal clicked');
      },
    );
    setState(() {
      markarList.add(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool canDrawPolygon = markarList.length >= 1;
    final Set<Polygon> polygons = canDrawPolygon
        ? {
      Polygon(
        polygonId: PolygonId('polygon_1'),
        points: markarList.map((marker) => marker.position).toList(),
        strokeWidth: 2,
        strokeColor: Colors.teal,
        fillColor: Colors.purple.withOpacity(0.15),
      ),
    }
        : {};

    return Scaffold(
      body: _currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(markarList),
        polygons: polygons,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _updateCameraPosition();
        },
        onTap: (LatLng position) {
          _addMarker(position);
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
