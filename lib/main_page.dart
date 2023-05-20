import 'package:flutter/material.dart';
import 'package:flutter_movie_application/list_page.dart';
import 'package:flutter_movie_application/grid_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.sort),
            onSelected: (value) {
              if (value == 0)
                print("예매율순");
              else if (value == 1)
                print("추천순");
              else if (value == 2) print("최신순");
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 0,
                  child: Text("예매율순"),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text("추천순"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("최신순"),
                ),
              ];
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Grid',
          ),
        ],
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
            print("$_selectedTabIndex Tab Clicked");
          });
        },
      ),
      body: _selectedTabIndex == 0 ? ListPage() : GridPage(),
    );
  }
}
