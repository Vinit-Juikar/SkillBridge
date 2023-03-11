import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../login/auth.dart';

// import '../firebase/auth.dart';
TextEditingController _controllerName = TextEditingController();
TextEditingController _controllerAddress = TextEditingController();

class ProviderProfile extends StatelessWidget {
  const ProviderProfile({super.key});
  @override
  Widget build(BuildContext context) {
    final User? user = Auth().currentUser;
    CollectionReference users =
        FirebaseFirestore.instance.collection('providerInformation');
    DocumentReference docRef = users.doc(user?.phoneNumber);
    docRef.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        String name = documentSnapshot.get('name');
        String address = documentSnapshot.get('address');
        _controllerName.text = name;
        _controllerAddress.text = address;
        print('Name: $name');
      } else {
        String name = '';
        String address = '';
        print('Document does not exist');
      }
    });
    var number = user?.phoneNumber ?? '9876543210';
    print(user?.phoneNumber);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Lottie.asset('assets/providerProfile.json',
                        width: double.infinity, repeat: false),
                    TextFormField(
                      controller: _controllerName,
                      decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'Rohit Bagade',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 25, 85, 134))),
                    ),
                    TextFormField(
                      controller: _controllerAddress,
                      decoration: const InputDecoration(
                          labelText: 'Address',
                          hintText: 'Sec 3 Kharghar',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 25, 85, 134))),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          createUser(_controllerName.text,
                              _controllerAddress.text, number);
                        },
                        child: const Text('Save'))
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    signOut();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: const [Icon(Icons.logout), Text('Signout')],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// final User? user = FirebaseAuth.instance.currentUser;

void createUser(String name, String address, String number) async {
  final docUser =
      FirebaseFirestore.instance.collection('providerInformation').doc(number);
  docUser.get().then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      docUser.update({'name': name,'address':address})
    .then((value) => print('Field updated successfully'))
    .catchError((error) => print('Failed to update field: $error'));
    } else {
      final userProfile = UserProfile(
        name: name,
        address: address,
        number: number,
        id: docUser.id,
      );
      final json = userProfile.toJson();
      docUser.set(json);
    }
  });
}

class UserProfile {
  final String name;
  final String address;
  final String number;
  final String id;

  UserProfile({
    required this.name,
    required this.address,
    required this.number,
    required this.id,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'number': number,
        'RList':[],
        'SList':[]
      };
}

final user = FirebaseAuth.instance.currentUser;
Future<void> signOut() async {
  await Auth().signOut();
}
