import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skillbridge/provider/provider_info_route.dart';
import 'package:skillbridge/provider/provider_profile.dart';

class providerHomeScreen extends StatefulWidget {
  const providerHomeScreen({super.key});

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(
          fontSize: 15,
        )),
    Text('Search Page',
        style: TextStyle(
          fontSize: 15,
        )),
    Text('Profile Page',
        style: TextStyle(
          fontSize: 15,
        ))
  ];

  @override
  State<providerHomeScreen> createState() => _providerHomeScreenState();
}

class _providerHomeScreenState extends State<providerHomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  List services1 = [
    "assets/providerAssets/Images/Carpenter.webp",
    "assets/providerAssets/Images/Electrician.png",
    "assets/providerAssets/Images/Electronic_repaireres.png",
    "assets/providerAssets/Images/House_maid.png",
    "assets/providerAssets/Images/Locksmith.png",
    "assets/providerAssets/Images/Mechanic.png",
    "assets/providerAssets/Images/Painter.jpg",
    "assets/providerAssets/Images/plumber.png",
    "assets/providerAssets/Images/Tile-Setter.png",
    "assets/providerAssets/Images/Welder.png",
  ];

  // List services2 = [

  // ];

  final int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProviderProfile(),));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                      'assets/profile.png'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1.05,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 215, 250, 16),
                          blurRadius: 10.0),
                    ],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    color: Color(0xff1A2270)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset(
                              'assets/providerAssets/star.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const Text(
                              '\nFeatures: \n 1.Get personalised data \n\n 2.Connect with top priority\n Artisans',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 244, 227, 39)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(180, 60), backgroundColor: Colors.purple,
                                ),
                                child: AnimatedBuilder(
                                  animation: _animation,
                                  builder: (context, child) {
                                    return Transform.translate(
                                      offset: const Offset(0, 0),
                                      child: const Text(
                                        'Upgrade to Premium',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 244, 227, 39)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderInfoRoutes(index),));
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
          Expanded(
              child: Stack(
            children: [
              Positioned(
                left: 15,
                child: Container(
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.width / 1.8,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: Text(
                    "History 📃",
                    style: TextStyle(fontSize: 30),
                  )),
                ),
              ),
              Positioned(
                left: 250,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff1A2270),
                  ),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2.7,
                  child: Lottie.asset(
                      "assets/providerAssets/animations/69114-shopping-cart.json",
                      fit: BoxFit.fill),
                ),
              ),
              Positioned(
                left: 15,
                top: 75,
                child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 1.8,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 213, 190, 252),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: Text(
                    "🔅 Support \n Locals 🔅",
                    style: TextStyle(fontSize: 30),
                  )),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}