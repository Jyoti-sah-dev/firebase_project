import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';
import '../add_card_screen.dart';

class GetDetailScreen extends StatefulWidget {
  final String id;

  const GetDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _GetDetailScreenState createState() => _GetDetailScreenState();
}

class _GetDetailScreenState extends State<GetDetailScreen> {
  late DocumentSnapshot<Map<String, dynamic>> product;
  bool isInCart = false;

  @override
  void initState() {
    super.initState();
    checkIfInCart();
  }

  void checkIfInCart() async {
    final cart = await FirebaseFirestore.instance.collection('cart').doc(widget.id).get();
    setState(() {
      isInCart = cart.exists;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Center(child: Text("Product Details", style: TextStyle(color: Colors.white))),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              createDynamicLink(widget.id);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: getProductDetails(),
        builder: (context,  snapshot) {

          product = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SizedBox(
                height: 480,
                child: Card(
                  elevation: 12,
                  shadowColor: Colors.purpleAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Image.network("${product['imageUrl']}"),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          "Product ${product['title']}",
                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(Icons.attach_money, size: 16),
                          ),
                          Text("${product['price']}"),
                        ],
                      ),
                      // const SizedBox(height: 16),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 20),
                      //   child: Text("Description: ${product['desc']}"),
                      // ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: isInCart
                              ? null
                              : () {
                            addToCart();
                          },
                          child: Text(isInCart ? "Already in Cart" : "Add to Cart"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> createDynamicLink(String id) async {
    final DynamicLinkParameters dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: 'https://authenticationui.page.link',
      link: Uri.parse('https://authenticationui.page.link.com?productId=$id'),
      androidParameters: const AndroidParameters(
        packageName: 'com.example.firebase_project',
      ),
    );

    final ShortDynamicLink shortLink = await FirebaseDynamicLinks.instance
        .buildShortLink(dynamicLinkParams, shortLinkType: ShortDynamicLinkType.short);

    final Uri shortUrl = shortLink.shortUrl;

    Share.share(shortUrl.toString());
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getProductDetails() async {
    final firebase = FirebaseFirestore.instance;
    var productData = await firebase.collection("prodcat").doc(widget.id).get();
    setState(() {
      product = productData;
    });
    return productData;
  }

  Future<void> addToCart() async {
    final firebase = FirebaseFirestore.instance;
    await firebase.collection("cart").doc(widget.id).set(product.data()!);
    setState(() {
      isInCart = true;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddToCartScreen(id: widget.id)),
    );
  }
}
