import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/screens/navs/discover_screen.dart';
import 'package:movie_review/screens/navs/home_screen.dart';
import 'package:movie_review/screens/navs/notification_screen.dart';
import 'package:movie_review/screens/navs/profile_screen.dart';

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
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          WillPopScope(
            onWillPop: () async {
              setState(() {
                _onNavItemTapped(_currentIndex = 0);
              });
              return false;
            },
            child: const HomePage(),
          ),
          WillPopScope(
            onWillPop: () async {
              setState(() {
                _onNavItemTapped(_currentIndex = 0);
              });
              return false;
            },
            child: const DiscoverScreen(),
          ),
          WillPopScope(
            onWillPop: () async {
              setState(() {
                _onNavItemTapped(_currentIndex = 0);
              });
              return false;
            },
            child: const NotificationScreen(),
          ),
          WillPopScope(
            onWillPop: () async {
              setState(() {
                _onNavItemTapped(_currentIndex = 0);
              });
              return false;
            },
            child: const ProfileScreen(),
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
