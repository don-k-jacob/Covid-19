import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Screens/Home.dart';
import 'constents.dart';
import 'package:covid/Screens/Maps.dart';
import 'package:covid/Screens/Search.dart';
import 'package:covid/Screens/Settings.dart';
List<Widget> _pages = [
  Home(),
  Map(),
  Search(),
  Settings(),
];
int _selectedIndex = 0;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
Data data;

class _HomePageState extends State<HomePage> {
  @override
   initState()  {
    // TODO: implement initState
    super.initState();
    setState(() {
      covidData();
    });
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('People'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('People'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        backgroundColor: Colors.red,
        selectedItemColor: Color(0xff3F3D56),
        unselectedItemColor: Color(0xff9D9CB5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      appBar: AppBar(
        title: Text('covid-19 updates'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.black,
      body:_pages[_selectedIndex],
    );
  }
}


