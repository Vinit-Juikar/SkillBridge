import 'package:flutter/material.dart';
import 'package:skillbridge/provider_screen/providerExplore.dart';
import 'package:skillbridge/provider_screen/providerHomeScreen.dart';
import 'package:skillbridge/provider_screen/providerNews.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static List<Widget> _widgetOptions = <Widget>[
  //   providerHomeScreen(),
  //   providerExplore(),
  //   Text(
  //     'Learn',
  //     style: optionStyle,
  //   ),
  //   providerNews()
  // ];

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
      body: const Center(
          // child: _widgetOptions.elementAt(_selectedIndex),
          ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online_outlined),
            label: 'Learn',
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
