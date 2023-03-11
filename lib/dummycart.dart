import 'package:flutter/material.dart';

class DummyCart extends StatelessWidget {
  const DummyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(12),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.amber,
                border: Border.all(color: const Color.fromARGB(96, 158, 158, 158)),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 300,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/workMen.jpeg',
                          width: MediaQuery.of(context).size.width / 2.7,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width / 2,
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 30,
                              child: const FittedBox(
                                fit: BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                child: Text("Lakhan Mehta"),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 30,
                              child: const FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.contain,
                                child: Text("Rating:3.5"),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 30,
                              child: const FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.contain,
                                child: Text("Gender:female"),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Container(
                    height: 110,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: const [
                        Spacer(),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.contain,
                            child: Text("Address: 27, Kothrud, Pune"),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: double.infinity,
                          height: 30,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.contain,
                            child: Text("Phone: 9876543210"),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
