// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class AddRestaurantScreen extends StatefulWidget {
//   const AddRestaurantScreen({super.key});
//
//   @override
//   _AddRestaurantScreenState createState() => _AddRestaurantScreenState();
// }
//
// class _AddRestaurantScreenState extends State<AddRestaurantScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//
//    LatLng selectedLocation;
//
//   GoogleMapController mapController;
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//
//   void _onMapTap(LatLng location) {
//     setState(() {
//       selectedLocation = location;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Restaurant'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Restaurant Name'),
//             ),
//             SizedBox(height: 10.0),
//             TextField(
//               controller: addressController,
//               decoration: InputDecoration(labelText: 'Address'),
//             ),
//             SizedBox(height: 10.0),
//             TextField(
//               controller: descriptionController,
//               decoration: InputDecoration(labelText: 'Description'),
//               maxLines: 3,
//             ),
//             const SizedBox(height: 20.0),
//             Container(
//               height: 300.0,
//               child: GoogleMap(
//                 onMapCreated: _onMapCreated,
//                 onTap: _onMapTap,
//                 initialCameraPosition: const CameraPosition(
//                   target: LatLng(0, 0),
//                   zoom: 2,
//                 ),
//                 markers: selectedLocation != null
//                     ? Set<Marker>.from([
//                   Marker(
//                     markerId: MarkerId('selected-location'),
//                     position: selectedLocation,
//                     draggable: true,
//                     onDragEnd: (LatLng newPosition) {
//                       setState(() {
//                         selectedLocation = newPosition;
//                       });
//                     },
//                   ),
//                 ])
//                     : {},
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: ()async{
//                 // Handle saving restaurant data (e.g., send to backend)
//                 String name = nameController.text;
//                 String address = addressController.text;
//                 String description = descriptionController.text;
//                 double latitude = selectedLocation.latitude;
//                 double longitude = selectedLocation.longitude;
//                 // Implement saving logic here
//               },
//               child: Text('Save Restaurant'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
