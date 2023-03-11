import 'package:flutter/material.dart';
import 'package:skillbridge/seeker/recieve_seeker_request.dart';
import 'package:skillbridge/seeker/send_seeker_request.dart';

class RequestSeeker extends StatelessWidget {
  const RequestSeeker({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            bottom: const TabBar(
              indicatorColor: Colors.amber,
              tabs: [
                Tab(icon: Icon(Icons.arrow_downward,color: Colors.red,)),
                Tab(icon: Icon(Icons.arrow_upward,color: Colors.green,)),
              ],
            ),
            title: const Text('Request',style: TextStyle(color: Colors.black),),
          ),
          body:  const TabBarView(
            children: [
              RecieveSeekerRequests(),
              SendSeekerRequests(),
            ],
          ),
        ),
      );
  }
}