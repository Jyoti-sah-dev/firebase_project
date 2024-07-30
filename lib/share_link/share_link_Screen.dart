// // import 'dart:async';
// //
// // import 'package:cloud_firestore/cloud_firestore.dart';
// //
// // import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// // import 'package:flutter/material.dart';
// // import 'package:share_plus/share_plus.dart';
// //
// // class DynamicLinkService extends StatefulWidget {
// //   const DynamicLinkService({super.key});
// //
// //   @override
// //   State<DynamicLinkService> createState() => _DynamicLinkServiceState();
// // }
// //
// // class _DynamicLinkServiceState extends State<DynamicLinkService> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Colors.deepPurple,
// //           title: const Center(
// //               child: Text(
// //             "~* Share Link *~",
// //             style: TextStyle(color: Colors.white),
// //           )),
// //         ),
// //         body: SafeArea(
// //           child: FutureBuilder(
// //             future:getProdactDetails(),
// //             builder: (context,snapshot){
// //
// //               var data =snapshot.data?.docs;
// //               return ListView.builder(
// //                   itemCount:data?.length,
// //                 itemBuilder: (context,index){
// //                     var product = data![index].id;
// //                     return InkWell(
// //                       onTap:(){
// //                         Navigator.push(context, MaterialPageRoute(builder:(context) => GestureDetector(),));
// //                       },
// //                       child: ListTile(
// //                         leading: Image.network("${data[index]['imageUrl']}"),
// //                         title: Text("${data }"),
// //                       ),
// //                     );
// //                 },
// //               );
// //             },
// //           ),
// //         ),
// //
// //         // body: Padding(
// //         //   padding: EdgeInsets.all(10.0),
// //         //   child: Column(
// //         //     children: [
// //         //       Padding(
// //         //         padding: const EdgeInsets.only(left: 15),
// //         //         child: ElevatedButton(
// //         //             onPressed: () {
// //         //               createDynamicLink();
// //         //             },
// //         //             child: Center(child: Text("CREATE DYNIMIC LINK"))),
// //         //       ),
// //         //       SizedBox(
// //         //         height: 20,
// //         //       )
// //         //     ],
// //         //   ),
// //         // )
// //     );
// //   }
// //
// //   createDynamicLink() async {
// //     final dynamicLinkParams = DynamicLinkParameters(
// //       link: Uri.parse("https://www.example.com/"),
// //       uriPrefix: "https://authenticationui.page.link",
// //       androidParameters:
// //           const AndroidParameters(packageName: "com.example.firebase_project"),
// //     );
// //
// //     final dynamicLink =
// //         await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);
// //     await Share.share(dynamicLink.toString());
// //
// //
// //     }
// //   Future<QuerySnapshot<Map<String,dynamic>>> getProdactDetails(){
// //     final firebase = FirebaseFirestore.instance;
// //     var getData =firebase.collection("Dynamic").get();
// //     return getData;
// //
// //   }
// // }
// //
// //
//
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_project/share_link/get_detail_screen.dart';
// import 'package:flutter/material.dart';
//
// class DynamicLinkService extends StatefulWidget {
//   const DynamicLinkService({super.key});
//
//   @override
//   State<DynamicLinkService> createState() => _DynamicLinkServiceState();
// }
//
// class _DynamicLinkServiceState extends State<DynamicLinkService> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurpleAccent,
//         title: Center(child: const Text("~* Dynamic Link *~")),
//       ),
//       body: FutureBuilder(
//         future: getProductData(),
//         builder: (context, snapshot){
//           var data = snapshot.data?.docs;
//           if(data?.isNotEmpty == true){
//             return ListView.builder(
//               itemCount: data?.length,
//
//                 itemBuilder: (context,index){
//                 return InkWell(
//                   onTap: (){
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context)=>GetDetailScreen(
//                         productId:data[index].id, id: '',
//                       ))
//                     );
//                   },
//                   child:
//                   Card(
//                     margin: EdgeInsets.all(10),
//                     child: Padding(
//                       padding: EdgeInsets.all(10),
//                       child: Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 40,
//                             backgroundImage: NetworkImage(data![index]['imageUrl']),
//                           ),
//                           SizedBox(height: 15,),
//                           Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(height: 5,),
//                                   Text(
//                                       data[index]['title'],
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 5,),
//                                   Text('price:\$${data[index]['price']}',
//                                     style: const TextStyle(fontSize: 14,
//                                       color:Colors.deepPurpleAccent
//                                     ),
//                                   )
//                                 ],
//                               ))
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//                 }
//                 );
//
//           }else{
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//
//   }
//   Future<QuerySnapshot<Map<String,dynamic>>> getProductData()async{
//     var product =FirebaseFirestore.instance;
//     return await product.collection("prodcat").get();
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'get_detail_screen.dart';

class ShareLinkScreen extends StatefulWidget {
  const ShareLinkScreen({super.key});

  @override
  State<ShareLinkScreen> createState() => _ShareLinkScreenState();
}

class _ShareLinkScreenState extends State<ShareLinkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("~~* Share Link *~~",style: TextStyle(color: Colors.white),),

      ),
      body: SafeArea(
        child: FutureBuilder(
          future: getProductDetails(),
          builder: (context, snapshot) {
            var data = snapshot.data?.docs;
            return ListView.builder(
              itemCount: data?.length ?? 0,
              itemBuilder: (context, index) {
                var product = data![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => GetDetailScreen(id: product.id),
                    ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.deepPurpleAccent,
                    child: ListTile(
                      leading: Image.network("${product['imageUrl']}"),
                      title: Text("${product['title']}"),
                      subtitle: Row(
                        children: [
                          Text("${product['price']}"),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {
                              createDynamicLink(product.id);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> createDynamicLink(String id) async {
    final dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: 'https://authenticationui.page.link',
      link: Uri.parse('https://authenticationui.page.link.com?productId=$id'),
      androidParameters: const AndroidParameters(packageName: "com.example.firebase_project"),
    );
    final dynamicLink = await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);
    await Share.share(dynamicLink.toString());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getProductDetails() {
    final firebase = FirebaseFirestore.instance;
    var getData = firebase.collection("prodcat").get();
    return getData;
  }
}