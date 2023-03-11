import 'package:flutter/material.dart';
import 'package:skillbridge/seeker/seeker_request.dart';
import 'package:skillbridge/seekerHomeScreen/_NewsletterSeeker.dart';
import 'package:skillbridge/seekerHomeScreen/_seekerHomeScreen.dart';
import 'package:skillbridge/seekerHomeScreen/_selfAdvertise.dart';

class MySeekerNavBar extends StatefulWidget {
  const MySeekerNavBar({super.key});

  @override
  State<MySeekerNavBar> createState() => _MySeekerNavBarState();
}

class _MySeekerNavBarState extends State<MySeekerNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const seekerHomeScreen(),
     exploreProviderHomeScreen(),
    const RequestSeeker(),
     NewsletterSeeker(),
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
            icon: Icon(Icons.book_online_outlined),
            label: 'Self Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline_outlined),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: 'Newsletter',
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
