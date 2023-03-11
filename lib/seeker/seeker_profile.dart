import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../login/auth.dart';

// import '../firebase/auth.dart';

final TextEditingController _controllerName = TextEditingController();
final TextEditingController _controllerWork = TextEditingController();
final TextEditingController _controllerAddress = TextEditingController();
final TextEditingController _controllerPhone = TextEditingController();
final TextEditingController _controllerRate = TextEditingController();
final TextEditingController _controllerGender = TextEditingController();

class SeekerProfile extends StatelessWidget {
  const SeekerProfile({super.key});
  @override
  Widget build(BuildContext context) {
// final user = FirebaseAuth.instance.currentUser;
    final User? user = Auth().currentUser;
    CollectionReference users =
        FirebaseFirestore.instance.collection('seekersInformation');
    DocumentReference docRef = users.doc(user?.phoneNumber);
    docRef.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        String name = documentSnapshot.get('name');
        String work = documentSnapshot.get('work');
        String address = documentSnapshot.get('address');
        String gender = documentSnapshot.get('gender');
        _controllerName.text = name;
        _controllerWork.text = work;
        _controllerAddress.text = address;
        _controllerGender.text = gender;
        print('Name: $name');
      } else {
        String name = '';
        String address = '';
        print('Document does not exist');
      }
    });
    var number = '';
    number = user?.phoneNumber ?? 'User email';
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
                    Lottie.asset('assets/seekerProfile.json',
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
                      controller: _controllerWork,
                      decoration: const InputDecoration(
                          labelText: 'Work',
                          hintText: 'Carpenter',
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
                    TextFormField(
                      controller: _controllerGender,
                      decoration: const InputDecoration(
                          labelText: 'Gender',
                          hintText: 'Male',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 25, 85, 134))),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          createUser(
                              _controllerName.text,
                              _controllerWork.text,
                              _controllerAddress.text,
                              _controllerGender.text,
                              number);
                          saveName();
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

void saveName() async {
  final user = FirebaseAuth.instance.currentUser;
  await user?.updateDisplayName('true');
}
// final User? user = FirebaseAuth.instance.currentUser;

void createUser(String name, String work, String address, String gender,
    String Number) async {
  final docUser =
      FirebaseFirestore.instance.collection('seekersInformation').doc(Number);
  docUser.get().then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      docUser.update({'name': name,'address':address,'work':work,'gender':gender})
    .then((value) => print('Field updated successfully'))
    .catchError((error) => print('Failed to update field: $error'));
    } else {
      final userProfile = UserProfile(
        name: name,
        work: work,
        address: address,
        gender: gender,
        number: Number,
        id: docUser.id,
      );
      final json = userProfile.toJson();
      docUser.set(json);
    }
  });
}

class UserProfile {
  final String name;
  final String work;
  final String address;
  final String gender;
  final String number;
  final String id;

  UserProfile({
    required this.name,
    required this.work,
    required this.address,
    required this.gender,
    required this.number,
    required this.id,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'work': work,
        'address': address,
        'gender': gender,
        'phone':number,
        'rating':4.51599494,
        'RList': [],
        'SList': [],
      };
}

final user = FirebaseAuth.instance.currentUser;
Future<void> signOut() async {
  await Auth().signOut();
}
