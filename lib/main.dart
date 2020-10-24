import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Tab Bar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String _selectedTab = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: _selectedTab == "Home"
                  ? Colors.yellow
                  : (_selectedTab == "Search"
                      ? Colors.amber
                      : (_selectedTab == "Activity"
                          ? Colors.blue
                          : Colors.green)),
            ),
          ),
          // Tab Bar
          Padding(
            padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 12.0,
                bottom: MediaQuery.of(context).padding.bottom),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tabBarButton(context, Icon(Icons.home), "Home"),
                tabBarButton(context, Icon(Icons.search), "Search"),
                tabBarButton(context, Icon(Icons.notifications), "Activity"),
                tabBarButton(context, Icon(Icons.settings), "Settings"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tabBarButton(BuildContext context, Icon icon, String title) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 180),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: _selectedTab == title ? Colors.purple : Colors.transparent),
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                icon.icon,
                size: 25,
                color: _selectedTab == title ? Colors.white : Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: AnimatedSize(
                  duration: Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  vsync: this,
                  child: Text(
                    _selectedTab == title ? title : "",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: _selectedTab == title ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            _selectedTab = title;
          });
        },
      ),
    );
  }
}
