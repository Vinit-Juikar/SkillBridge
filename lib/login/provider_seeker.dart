import 'package:flutter/material.dart';

import 'auth.dart';

class ProviderSeeker extends StatelessWidget {
  const ProviderSeeker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                GestureDetector(
                  child: Material(
                    elevation: 8,
                        borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber,
                      ),
                      height: MediaQuery.of(context).size.width / 2.3,
                      alignment: Alignment.center,
                      child: const Text('Provider'),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(

                  child: Material(
                    elevation: 8,
                        borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber,
                      ),
                      height: MediaQuery.of(context).size.width / 2.3,
                      alignment: Alignment.center,
                      child: const Text('Seeker'),
                    ),
                  ),
                ),
                const Spacer(),
              ],
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
