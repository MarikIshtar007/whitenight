import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _tabIndex = 0;

  List<Widget> screens = [
    Center(
      child: Container(
        child: Text(
          "Dashboard Screen",
          style: TextStyle(fontSize: 33),
        ),
      ),
    ),
    Center(
      child: Container(
          child: Text(
        "Screen Two",
        style: TextStyle(fontSize: 33),
      )),
    ),
    Center(
      child: Container(
        child: Text(
          "Screen Three",
          style: TextStyle(fontSize: 33),
        ),
      ),
    ),
    Center(
      child: Container(
        child: Text(
          "Screen Four",
          style: TextStyle(fontSize: 33),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: Colors.blue,
        currentIndex: _tabIndex,
        onTap: (index) => setState(() {
          _tabIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              label: "Dashboard",
              icon: Icon(
                Icons.home,
                size: 30,
              )),
          BottomNavigationBarItem(
              label: "My Village",
              icon: Icon(
                Icons.connect_without_contact,
                size: 30,
              )),
          BottomNavigationBarItem(
              label: "Knowledge Base",
              icon: Icon(
                Icons.book,
                size: 30,
              )),
          BottomNavigationBarItem(
              label: "Notifications",
              icon: Icon(
                Icons.notifications_active,
                size: 30,
              ))
        ],
      ),
      body: screens[_tabIndex],
    );
  }
}
