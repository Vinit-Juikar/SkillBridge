import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login/auth.dart';

class SendProviderRequests extends StatefulWidget {
  const SendProviderRequests({super.key});

  @override
  State<SendProviderRequests> createState() => _SendProviderRequestsState();
}

class _SendProviderRequestsState extends State<SendProviderRequests> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 1),
    () => 'Data Loaded',
  );
  @override
  Widget build(BuildContext context) {
    var myList = [];
    final User? user = Auth().currentUser;
    var number = '';
    number = user?.phoneNumber ?? 'User email';
    CollectionReference users =
        FirebaseFirestore.instance.collection('providerInformation');
    DocumentReference docRef = users.doc(number);
    docRef.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        myList = documentSnapshot.get('SList');
        print(myList);
      } else {}
    });

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>(
        future: _calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: myList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SendRequestFormat(myList[index]);
                    }),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}

class SendRequestFormat extends StatefulWidget {
  var providerRequestId;
  SendRequestFormat(this.providerRequestId, {super.key});

  @override
  State<SendRequestFormat> createState() => _SendRequestFormatState();
}

class _SendRequestFormatState extends State<SendRequestFormat> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 1),
    () => 'Data Loaded',
  );
  @override
  Widget build(BuildContext context) {
    var seekerId = '';
    var work = '';
    final User? user = Auth().currentUser;
    var number = '';
    number = user?.phoneNumber ?? 'User email';
    CollectionReference users =
        FirebaseFirestore.instance.collection('providerRequests');
    DocumentReference docRef = users.doc(widget.providerRequestId);
    docRef.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        seekerId = documentSnapshot.get('seekerId');
        work = documentSnapshot.get('work');
      } else {}
    });
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>(
        future: _calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[WithSeekerData(seekerId)];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}

class WithSeekerData extends StatefulWidget {
  var seekerId;
  WithSeekerData(this.seekerId, {super.key});

  @override
  State<WithSeekerData> createState() => _WithSeekerDataState();
}

class _WithSeekerDataState extends State<WithSeekerData> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 1),
    () => 'Data Loaded',
  );
  @override
  Widget build(BuildContext context) {
    var name = '';
    var gender = '';
    var work = '';
    CollectionReference users =
        FirebaseFirestore.instance.collection('seekersInformation');
    DocumentReference docRef = users.doc(widget.seekerId);
    docRef.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        name = documentSnapshot.get('name');
        gender = documentSnapshot.get('gender');
        work = documentSnapshot.get('work');
      } else {}
    });
    return FutureBuilder<String>(
      future: _calculation, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.all(10),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(  
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(gender=='female'?'assets/workWmn.jpg':'assets/workMen.jpeg'),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            'Name: $name',
                            style: const TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            'Gender: $gender',
                            style: const TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            'Work: $work',
                            style: const TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            ),
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            ),
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
}
