import "package:flutter/material.dart";

import '../favorite/presentation/pages/favorite_page.dart';
import '../location_search/presentation/pages/location_search_page.dart';

class BottomNavigationPage extends StatefulWidget {
  static const String routeName = '/';

  const BottomNavigationPage({
    Key? key,
  }) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentIndex = 0;

  final List _pages = [const LocationSearchPage(), const FavoritePage()];

  // TODO: move label to string source
  List<BottomNavigationBarItem> _getItems(BuildContext context) {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: "Search",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: "Favorite",
      )
    ];
  }

  void _onClickItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _getItems(context),
        onTap: _onClickItem,
      ),
      body: _pages[_currentIndex],
    );
  }
}
