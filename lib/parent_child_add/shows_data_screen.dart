import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreExample extends StatelessWidget {
  const FirestoreExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Example'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Data loaded successfully
          final List<DocumentSnapshot> users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              final userDoc = users[index];
              return ListTile(
                title: Text(userDoc.id), // Assuming user ID is displayed as title
                subtitle: StreamBuilder(
                  stream: userDoc.reference.collection('Parents').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> postSnapshot) {
                    if (postSnapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (postSnapshot.hasError) {
                      return Text('Error: ${postSnapshot.error}');
                    }

                    // Posts loaded successfully
                    final List<DocumentSnapshot> posts = postSnapshot.data!.docs;

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final postDoc = posts[index];
                        return ListTile(
                          title: Text(postDoc.id), // Assuming post ID is displayed as title
                          // You can add more fields of the post here
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
