
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'get_screen.dart';

class CreateFireStore extends StatefulWidget {
  const CreateFireStore({super.key});

  @override
  State<CreateFireStore> createState() => _CreateFireStoreState();
}

class _CreateFireStoreState extends State<CreateFireStore> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController  postController = TextEditingController();
  TextEditingController psController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: const Text(
            "~~* FireBase FireStore *~~",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.network("https://static-00.iconduck.com/assets.00/avatar-default-icon-1975x2048-2mpk4u9k.png",height: 200,width: 210,),
                const SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: 'Enter Name',
                      prefixIcon: const Icon(Icons.perm_identity,color: Colors.deepPurpleAccent,),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(24))),
                ),
                const SizedBox(height: 15),

                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'Enter Email',
                      prefixIcon: const Icon(Icons.email,color: Colors.deepPurpleAccent,),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(28))),
                ),
                const SizedBox(height: 15),

                TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.support_agent,color: Colors.deepPurpleAccent,),
                      labelText: 'Enter Age',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(28))),
                ),
                const SizedBox(height: 15),

                TextFormField(
                  controller: genderController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.manage_accounts_outlined,color: Colors.deepPurpleAccent,),
                      labelText: 'Enter Gender',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(28))),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: villageController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.home_work_outlined,color: Colors.deepPurpleAccent,),
                      labelText: 'Enter VillageName',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(28))),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: postController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.post_add,color: Colors.deepPurpleAccent,),
                      labelText: 'Enter PostName',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(28))),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: psController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.local_police_outlined,color: Colors.deepPurpleAccent,),
                      labelText: 'Enter police Station',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(28))),
                ),
                const SizedBox(height: 10),

                MaterialButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      addUsers(
                          nameController.text,
                          emailController.text,
                          ageController.text,
                          genderController.text,
                          villageController.text,
                          postController.text,
                          psController.text
                      )
                          .then((_) {
                        setState(() {
                          getUsers();
                        });
                      });
                    },
                    child: const Text(
                      "Add Users",
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      MaterialButton(
                        color: Colors.deepPurpleAccent,
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GetUserScreen(genderFilter: 'male'),
                            ),
                          );
                        },
                        child: const Text(
                          "Male Users",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 56),
                        child: MaterialButton(
                          color: Colors.deepPurpleAccent,
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GetUserScreen(genderFilter: 'female'),
                              ),
                            );
                          },
                          child: const Text(
                            "female Users",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  showMyBottomSheet(String docId) {
    var editNameController = TextEditingController();
    var editEmailController = TextEditingController();
    var editAgeController = TextEditingController();
    var editGenderController = TextEditingController();

    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  controller: editNameController,
                  decoration: InputDecoration(
                      labelText: 'Edit Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24))),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: editEmailController,
                  decoration: InputDecoration(
                      labelText: 'Edit Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24))),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: editAgeController,
                  decoration: InputDecoration(
                      labelText: 'Edit Age',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24))),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: editGenderController,
                  decoration: InputDecoration(
                      labelText: 'Edit Gender',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24))),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      await updateUsers(
                          docId,
                          editNameController.text,
                          editEmailController.text,
                          editAgeController.text,
                          editGenderController.text);
                      Navigator.pop(context);
                      setState(() {
                        getUsers();
                      });
                    },
                    child: const Text("Update")),
              ],
            ),
          );
        });
  }

  addUsers(String name, String email, String age, String gender, String village,String post, String ps) async {
    var fireStore = FirebaseFirestore.instance;
    fireStore.collection("Users").add({
      "name": name,
      "email": email,
      "phone": 7644962036,
      "gender": gender,
      "age": age,
      "address":{
        "vallage": village,
        "post": post,
        "police station": ps,
      }
    }).then((reference) {
      Fluttertoast.showToast(msg: reference.id);
      print("DocId: ${reference.id}");
    }).catchError((FirebaseException error) {
      Fluttertoast.showToast(msg: "${error.message}");});
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUsers()  {
    var firestore = FirebaseFirestore.instance;
    return firestore.collection("Users").snapshots();

  }

  updateUsers(String docId, String name, String email, String age,
      String gender) async {
    var firestore = FirebaseFirestore.instance;
    var users = firestore.collection("Users");
    await users.doc(docId).update({
      "name": name,
      "email": email,
      "age": age,
      "gender": gender,
    });
  }

  deleteUser(String docId) async {
    var firestore = FirebaseFirestore.instance;
    var users = firestore.collection("Users");
    await users.doc(docId).delete();
    setState(() {
      getUsers();
    });
  }
}