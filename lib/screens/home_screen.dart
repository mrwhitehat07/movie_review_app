import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool isLoggedOn = true;

  final PageController _pageController = PageController();

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onNavItemTapped,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          WillPopScope(
            onWillPop: () async {
              setState(() {
                // _currentIndex = 0;
                _onNavItemTapped(_currentIndex = 0);
              });
              return false;
            },
            child: Container(),
          ),
          WillPopScope(
            onWillPop: () async {
              setState(() {
                // _currentIndex = 0;
                _onNavItemTapped(_currentIndex = 0);
              });
              return false;
            },
            child: Container(),
          ),
          WillPopScope(
            onWillPop: () async {
              setState(() {
                // _currentIndex = 0;
                _onNavItemTapped(_currentIndex = 0);
              });
              return false;
            },
            child: Container(),
          ),
          WillPopScope(
            onWillPop: () async {
              setState(() {
                // _currentIndex = 0;
                _onNavItemTapped(_currentIndex = 0);
              });
              return false;
            },
            child: Container(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 0 ? EvaIcons.home : EvaIcons.homeOutline,
              color: Theme.of(context).iconTheme.color,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 1 ? EvaIcons.search : EvaIcons.searchOutline,
              color: Theme.of(context).iconTheme.color,
            ),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 2 ? EvaIcons.heart : EvaIcons.heartOutline,
              color: Theme.of(context).iconTheme.color,
            ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 3 ? EvaIcons.person : EvaIcons.personOutline,
              color: Theme.of(context).iconTheme.color,
            ),
            label: "Profile",
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
