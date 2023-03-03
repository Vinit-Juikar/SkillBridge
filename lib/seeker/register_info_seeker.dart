import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login/auth.dart';

// import '../firebase/auth.dart';

final TextEditingController _controllerName = TextEditingController();
final TextEditingController _controllerWork = TextEditingController();
final TextEditingController _controllerAddress = TextEditingController();
final TextEditingController _controllerPhone = TextEditingController();
final TextEditingController _controllerRate = TextEditingController();
final TextEditingController _controllerGender = TextEditingController();

class RegisterInfoSeeker extends StatelessWidget {
  const RegisterInfoSeeker({super.key});
  @override
  Widget build(BuildContext context) {
// final user = FirebaseAuth.instance.currentUser;
    final User? user = Auth().currentUser;
    var number = '';
    number = user?.phoneNumber ?? 'User email';
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Text(user?.displayName ?? 'No Name'),
              TextFormField(
                controller: _controllerName,
                decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Rohit Bagade',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 25, 85, 134))),
              ),
              TextFormField(
                controller: _controllerWork,
                decoration: const InputDecoration(
                    labelText: 'Work',
                    hintText: 'Carpenter',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 25, 85, 134))),
              ),
              TextFormField(
                controller: _controllerAddress,
                decoration: const InputDecoration(
                    labelText: 'Address',
                    hintText: 'Sec 3 Kharghar',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 25, 85, 134))),
              ),
              TextFormField(
                controller: _controllerPhone,
                decoration: const InputDecoration(
                    labelText: 'Gender',
                    hintText: 'Male',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 25, 85, 134))),
              ),
              ElevatedButton(
                  onPressed: () {
                    createUser(
                      _controllerName.text,
                      _controllerWork.text,
                      _controllerAddress.text,
                      _controllerPhone.text,
                      number
                    );
                    saveName();
                  },
                  child: const Text('Create'))
            ],
          ),
        ),
      ),
    );
  }
}
void saveName()async{
final user = FirebaseAuth.instance.currentUser;
  await user?.updateDisplayName('true');
}
// final User? user = FirebaseAuth.instance.currentUser;

void createUser(
    String name, String work, String address, String gender,String Number) async {
  final docUser =
      FirebaseFirestore.instance.collection('seekersInformation').doc(Number);

  final userProfile = UserProfile(
    name: name,
    work: work,
    address: address,
    gender: gender,
    id: docUser.id,
  );
  final json = userProfile.toJson();
  await docUser.set(json);
}

class UserProfile {
  final String name;
  final String work;
  final String address;
  final String gender;
  final String id;

  UserProfile({
    required this.name,
    required this.work,
    required this.address,
    required this.gender,
    required this.id,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'work': work,
        'address': address,
        'gender': gender,
      };
}
