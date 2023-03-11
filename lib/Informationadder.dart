import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final TextEditingController _controllerName = TextEditingController();
final TextEditingController _controllerWork = TextEditingController();
final TextEditingController _controllerAddress = TextEditingController();
final TextEditingController _controllerPhone = TextEditingController();
final TextEditingController _controllerRate = TextEditingController();
final TextEditingController _controllerGender = TextEditingController();

class Createdb extends StatelessWidget {
  const Createdb({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  for (int i = 0; i < 25; i++) {
                  createData();
                  }
                },
                child: const Text('Do it'),
              ),
            )),
      ),
    );
  }
}

void createData() {
  List firstNames = ["Aaradhya", "Ananya", "Anjali", "Diya", "Gauri", "Isha", "Jiya", "Kavya", "Khushi", "Krisha", "Mahi", "Mira", "Neha", "Palak", "Pooja", "Rhea", "Riya", "Sakshi", "Sana", "Sanjana", "Shreya", "Simran", "Sneha", "Suhani", "Tanvi", "Tanya", "Trisha", "Urvi", "Vaishnavi", "Vidhi", "Zoya"];
  List surnames = [
    "Agarwal",
    "Bhalla",
    "Chopra",
    "Dutta",
    "Gupta",
    "Jain",
    "Kapoor",
    "Kumar",
    "Mahajan",
    "Malhotra",
    "Mehta",
    "Mehra",
    "Mishra",
    "Nair",
    "Patel",
    "Rana",
    "Rao",
    "Reddy",
    "Sethi",
    "Shah",
    "Sharma",
    "Singh",
    "Tandon",
    "Thakur",
    "Verma",
    "Yadav",
    "Zaveri",
    "Zutshi"
  ];
  List work = [
    "Carpenter",
    "Electrician",
    "Electronic_repaireres",
    "house_maid",
    "locksmith",
    "Mechanic",
    "Painter",
    "plumber",
    "Tile_setter",
    "Welder"
  ];
  List address = [
    "1, Shanti Nagar, Mumbai",
    "10, Rajiv Chowk, Delhi",
    "23, Park Street, Kolkata",
    "5, MG Road, Bangalore",
    "12, Civil Lines, Jaipur",
    "8, Race Course Road, Chennai",
    "15, Shivaji Nagar, Pune",
    "9, Karol Bagh, Delhi",
    "4, Adarsh Colony, Lucknow",
    "17, Lajpat Nagar, Delhi",
    "7, Gandhi Road, Ahmedabad",
    "2, Ganga Vihar, Varanasi",
    "3, Sarojini Nagar, Lucknow",
    "18, Cantonment Area, Hyderabad",
    "14, Juhu Beach, Mumbai",
    "6, Fraser Road, Patna",
    "11, Park Lane, Hyderabad",
    "22, Residency Road, Pune",
    "20, MG Marg, Allahabad",
    "19, Jawahar Nagar, Jaipur",
    "16, Connaught Place, Delhi",
    "25, Jayanagar, Bangalore",
    "13, Kankarbagh, Patna",
    "27, Kothrud, Pune",
    "24, Anna Nagar, Chennai",
    "21, Banjara Hills, Hyderabad",
    "29, Sector 17, Chandigarh",
    "30, Vijay Nagar, Indore",
    "26, Andheri West, Mumbai",
    "28, Salt Lake City, Kolkata"
  ];
  List phone = [
    "9876543210",
    "9812345678",
    "9898989898",
    "9999999999",
    "9867676767",
    "9834567890",
    "9865321470",
    "9876549876",
    "9856321470",
    "9812345678",
    "9898989898",
    "9999999999",
    "9867676767",
    "9834567890",
    "9865321470",
    "9876549876",
    "9856321470",
    "9812345678",
    "9898989898",
    "9999999999",
    "9867676767",
    "9834567890",
    "9865321470",
    "9876549876",
    "9856321470",
    "9812345678",
    "9898989898",
    "9999999999",
    "9867676767",
    "9834567890"
  ];
  String Fname = getRandomElement(firstNames);
  String Lname = getRandomElement(surnames);
  String fullName = "$Fname $Lname";
  String workN = getRandomElement(work);
  String addressP = getRandomElement(address);
  String Phone = getRandomElement(phone);
  final random = Random();
  double rating=random.nextDouble()*4.5;
  createUser(fullName, workN, addressP, Phone,rating);
}

getRandomElement(List list) {
  final random = Random();
  var i = random.nextInt(list.length);
  return list[i];
}

void createUser(String name, String work, String address, String phone,double rating) async {
  final docUser = FirebaseFirestore.instance.collection('providersInformation').doc();

  final userProfile = UserProfile(
    name: name,
    work: work,
    address: address,
    phone: phone,
    rating: rating,
    id: docUser.id,
  );
  final json = userProfile.toJson();
  await docUser.set(json);
}

class UserProfile {
  final String name;
  final String work;
  final String address;
  final String phone;
  final double rating;
  final String id;

  UserProfile({
    required this.name,
    required this.work,
    required this.address,
    required this.phone,
    required this.rating,
    required this.id,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        // 'work': work,
        'address': address,
        'phone': phone,
        // 'rating': rating,
        // 'gender':'female',
        'RList':[],
        'SList':[]
      };
}
