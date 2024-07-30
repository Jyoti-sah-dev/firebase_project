// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final Completer<GoogleMapController>_controller =Completer();
//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.4279613380664, -122.085749655962),
//     zoom: 14,
//   );
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       body: GoogleMap(
//         initialCameraPosition: _kGooglePlex,
//         mapType: MapType.normal,
//         myLocationEnabled: true,
//         compassEnabled: false,
//         onMapCreated: (GoogleMapController controller){
//           _controller.complete(controller);
//         }
//         ,
//       ),
//       appBar: AppBar(
//         title: Text("google map"),
//       ),
//
//     );
//
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class GoogleMaping extends StatefulWidget {
  const GoogleMaping({super.key});

  @override
  State<GoogleMaping> createState() => _GoogleMapingState();
}

class _GoogleMapingState extends State<GoogleMaping> {
  final  locationController = Location();
  static const googlePlex = LatLng(37.4223, -122.0848);
  static const mountainView = LatLng(37.3861, -122.0839);
  LatLng? currentPosition;
  @override

  void initState() {
    super.initState();
    WidgetsBinding.instance.
    addPostFrameCallback((_)async => getLocationUpdates());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPosition == null ? const Center(child: CircularProgressIndicator(),):
      GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: googlePlex,
          zoom: 13,
        ),
        markers: {
          const Marker(
            markerId: MarkerId("sourceLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: googlePlex,
          ),
          const Marker(markerId: MarkerId("DestinationLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: googlePlex,
          )
        },
      ),

    );
  }
  Future<void> getLocationUpdates() async {
    bool serviseEnabled;
    PermissionStatus permissionGranted;
    serviseEnabled = await locationController.serviceEnabled();
    if(serviseEnabled){
      serviseEnabled = await locationController.requestService();
    }else{
      return;
    }
    permissionGranted = await locationController.hasPermission();
    if(permissionGranted==PermissionStatus.denied){
      permissionGranted = await locationController.requestPermission();
      if(permissionGranted != PermissionStatus.granted){
        return;
      }
    }
    locationController.onLocationChanged.listen((currentLocation){
      if(currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          currentPosition =
              LatLng(currentLocation.longitude!, currentLocation.longitude!);
        });
        print(currentPosition);
      }
      });
    }
}