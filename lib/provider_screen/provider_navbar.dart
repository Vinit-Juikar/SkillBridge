// import 'package:anipedia/Screens/story/story.dart';
import 'package:flutter/material.dart';
import 'package:skillbridge/exploreProvider/exploreProviderHomeScreen.dart';
import 'package:skillbridge/provider/provider_request.dart';
import 'package:skillbridge/provider_screen/providerHomeScreen.dart';

import '../seekerHomeScreen/_NewsletterSeeker.dart';

class MyProviderNavBar extends StatefulWidget {
  const MyProviderNavBar({super.key});

  @override
  State<MyProviderNavBar> createState() => _MyProviderNavBarState();
}

class _MyProviderNavBarState extends State<MyProviderNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    providerHomeScreen(),
     exploreProviderHomeScreen(),
    const RequestsProvider(),
     NewsletterSeeker()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print('Value Changes');
  }

  @override
  Widget build(BuildContext context) {
    print("Number of times build");
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz_outlined),
            label: 'News',
          ),
        ],
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedItemColor: const Color.fromARGB(255, 11, 53, 126),
        selectedItemColor: const Color.fromARGB(255, 0, 174, 255),
        onTap: _onItemTapped,
      ),
    );
  }
}
