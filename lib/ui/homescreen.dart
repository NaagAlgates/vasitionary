import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:vasitionary/helper/constants.dart';
import 'package:vasitionary/ui/search_main_screen.dart';
import 'package:vasitionary/ui/secondpage.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  var prefSize=Size.fromHeight(75.0);

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/images/app_background.jpg"),
                fit: BoxFit.cover)),
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: prefSize, // here the desired height
              child: AppBar(
                title: Text(APPLICATION_NAME),
              )),
          body: new Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: _getPage(currentPage),
            ),
          ),
          bottomNavigationBar: FancyBottomNavigation(
            tabs: [
              TabData(
                iconData: Icons.search,
                title: HINT_SEARCH_TEXT,
              ),
              TabData(
                iconData: Icons.apps,
                title: HINT_SORKKUVARI_TEXT,
              ),
              TabData(iconData: Icons.settings, title: HINT_SETTINGS_TEXT)
            ],
            initialSelection: 1,
            key: bottomNavigationKey,
            onTabChangedListener: (position) {
              setState(() {
                currentPage = position;
                if(currentPage == 0){
                  prefSize = Size.fromHeight(120.0);
                }else{
                  prefSize = Size.fromHeight(75.0);
                }
              });
            },
          ),
        ));
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return
            /*Text("This is the home page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
            ),
            RaisedButton(
              child: Text(
                "Change to page 3",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                final FancyBottomNavigationState fState =
                    bottomNavigationKey.currentState;
                fState.setPage(2);
              },
            )*/
            new SearchHomeScreen();
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the search page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
            )
          ],
        );
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the basket page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            )
          ],
        );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
