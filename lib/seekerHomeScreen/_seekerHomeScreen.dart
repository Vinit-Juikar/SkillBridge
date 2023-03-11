import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skillbridge/seeker/seeker_info_route.dart';
import 'package:skillbridge/seeker/seeker_profile.dart';

List services1 = [
  "assets/images/Carpenter.webp",
  "assets/images/Electrician.png",
  "assets/images/Electronic_repaireres.png",
  "assets/images/House_maid.png",
  "assets/images/Locksmith.png",
  "assets/images/Mechanic.png",
  "assets/images/Painter.jpg",
  "assets/images/plumber.png",
  "assets/images/Tile-Setter.png",
  "assets/images/Welder.png",
];

class seekerHomeScreen extends StatefulWidget {
  const seekerHomeScreen({super.key});

  @override
  State<seekerHomeScreen> createState() => _seekerHomeScreenState();
}

class _seekerHomeScreenState extends State<seekerHomeScreen> {
  List services2 = [
    "assets/images/Mechanic.png",
    "assets/images/Painter.jpg",
    "assets/images/plumber.png",
    "assets/images/Tile-Setter.png",
    "assets/images/Welder.png",
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: const Color.fromARGB(210, 59, 255, 245),
        backgroundColor: const Color(0xff1A2270),
        title: Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            const Text(
              "Skill Bridge",
              style: TextStyle(fontSize: 30),
            ),
            const Spacer(
              flex: 4,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SeekerProfile(),
                    ));
              },
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/profile.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
                child: Container(
                  padding:  const EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              child: CarouselSlider(
                  items: [
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromARGB(255, 126, 210, 252)),
                            color: const Color.fromARGB(255, 161, 219, 247)
                          ),
                          height: double.infinity,
                          width: MediaQuery.of(context).size.width / 1.05,
                          // color: Colors.green,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  height: 150,
                                  width: 200,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    child: Image.asset(
                                      "assets/images/ac_repairer.jpeg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 7,
                                top: 5,
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  // color: Colors.yellow,
                                  child: Text(
                                    "More Oppourtunities to explore in electronic sector",textAlign: TextAlign.justify,
                                  ), // add good google font and styling
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 20,
                                child: Container(
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.white),
                                      onPressed: () {},
                                      child: const Text("Apply Now")),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: double.infinity,
                          width: MediaQuery.of(context).size.width / 1.05,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromARGB(255, 126, 210, 252)),
                            color: const Color.fromARGB(255, 161, 219, 247)
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  height: 150,
                                  width: 200,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    child: Image.asset(
                                      "assets/images/ac_repairer.jpeg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 7,
                                top: 5,
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  // color: Colors.yellow,
                                  child: Text(
                                    "More Oppourtunities to explore in electronic sector",textAlign: TextAlign.justify,
                                  ), // add good google font and styling
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 20,
                                child: Container(
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.white),
                                      onPressed: () {},
                                      child: const Text("Apply Now")),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: double.infinity,
                          width: MediaQuery.of(context).size.width / 1.05,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromARGB(255, 126, 210, 252)),
                            color: const Color.fromARGB(255, 161, 219, 247)
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  height: 150,
                                  width: 200,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    child: Image.asset(
                                      "assets/images/ac_repairer.jpeg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 7,
                                top: 5,
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  // color: Colors.yellow,
                                  child: Text(
                                    "More Oppourtunities to explore in electronic sector",textAlign: TextAlign.justify,
                                  ), // add good google font and styling
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 20,
                                child: Container(
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.white),
                                      onPressed: () {},
                                      child: const Text("Apply Now")),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height / 4,
                    //   width: MediaQuery.of(context).size.width / 1.05,
                    //   color: Colors.amber,
                    // ),
                  ],
                  options: CarouselOptions(
                    height: 250.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.decelerate,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 3000),
                    viewportFraction: 0.9,
                  )),
            )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.8,
            width: MediaQuery.of(context).size.width / 1.05,
            // color: Colors.amber,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeekerInfoRoute(index),
                          ));
                    },
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 2.14,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 213, 190, 252),
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            services1[index].toString(),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class JobTypeFormat extends StatelessWidget {
  int index;
  JobTypeFormat(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width / 2.14,
        decoration: BoxDecoration(
          border: Border.all(width: 4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            services1[index].toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
