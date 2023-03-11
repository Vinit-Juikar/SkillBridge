import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skillbridge/provider_screen/provider_navbar.dart';
import 'package:skillbridge/seekerHomeScreen/seeker_bottom_nav.dart';

import 'auth.dart';

class ProviderSeeker extends StatelessWidget {
  const ProviderSeeker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 43, 145, 228),
                Color.fromARGB(255, 37, 93, 139),
                Color.fromARGB(255, 43, 145, 228),
              ],
            ),
          ),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.width / 1.4,
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      'Choose Login As,',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyProviderNavBar(),
                              ));
                        },
                        child: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            height: MediaQuery.of(context).size.width / 2.3,
                            alignment: Alignment.center,
                            child: Lottie.asset('assets/provider.json',
                                width: MediaQuery.of(context).size.width / 2.3,
                                repeat: true),
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MySeekerNavBar(),
                              ));
                        },
                        child: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            height: MediaQuery.of(context).size.width / 2.3,
                            alignment: Alignment.center,
                            child: Lottie.asset('assets/labour.json',
                                width: MediaQuery.of(context).size.width / 2.3,
                                repeat: true),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> signOut() async {
  await Auth().signOut();
}
