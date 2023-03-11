import 'package:flutter/material.dart';
import 'package:skillbridge/provider/recieve_provider_request.dart';
import 'package:skillbridge/provider/send_provider_request.dart';


class RequestsProvider extends StatelessWidget {
  const RequestsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    // final User? user = Auth().currentUser;
    // var number = '';
    // number = user?.phoneNumber ?? 'User email';
    // CollectionReference users =
    //     FirebaseFirestore.instance.collection('providerInformation');
    // DocumentReference docRef = users.doc(number);
    // docRef.get().then((DocumentSnapshot documentSnapshot) {
    //   if (documentSnapshot.exists) {
    //     myList = documentSnapshot.get('SList');
    //     print(myList);
    //   } else {}
    // });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            tabs: [
              Tab(
                  icon: Icon(
                Icons.arrow_downward,
                color: Colors.red,
              )),
              Tab(
                  icon: Icon(
                Icons.arrow_upward,
                color: Colors.green,
              )),
            ],
          ),
          title: const Text(
            'Request',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body:  const TabBarView(
          children: [RecieveProviderRequests(), SendProviderRequests()],
        ),
      ),
    );
  }
}

