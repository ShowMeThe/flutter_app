import 'package:flutter/material.dart';
import 'package:flutter_app/AppConstants.dart' show Constants;
import 'conversation_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light()
            .copyWith(primaryColor: Colors.black, cardColor: Colors.black),
        home: BottomNavigationDemo());
  }
}

class NavigationIconView {
  final Widget _icon;
  final Widget _activeIcon;
  final String _title;
  final Color _color;
  final BottomNavigationBarItem item;

  NavigationIconView({
    Widget icon,
    Widget activeIcon,
    String title,
    Color color,
  })  : _icon = icon,
        _activeIcon = activeIcon,
        _title = title,
        _color = color,
        item = BottomNavigationBarItem(
            icon: icon,
            activeIcon: activeIcon,
            title: Text(
              title,
            ),
            backgroundColor: color);
}

_buildPopupMenuItem(Widget icon, String title) {
  return new Row(
    children: <Widget>[
      icon,
      new Padding(padding: EdgeInsets.only(right: 15.0)),
      Text(
        title,
        style: TextStyle(color: Colors.white),
      )
    ],
  );
}

class BottomNavigationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigationDemo> {
  List<NavigationIconView> _navigationViews;
  List<Widget> _pagesView;
  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
          icon: Icon(
            Icons.message,
            color: Colors.black12,
          ),
          activeIcon: Icon(
            Icons.message,
            color: Colors.green,
          ),
          title: "消息",
          color: Colors.black12),
      NavigationIconView(
          icon: Icon(
            Icons.contacts,
            color: Colors.black12,
          ),
          activeIcon: Icon(
            Icons.contacts,
            color: Colors.green,
          ),
          title: "联系人",
          color: Colors.black),
      NavigationIconView(
          icon: Icon(
            Icons.find_replace,
            color: Colors.black12,
          ),
          activeIcon: Icon(
            Icons.find_replace,
            color: Colors.green,
          ),
          title: "发现",
          color: Colors.black12),
      NavigationIconView(
          icon: Icon(
            Icons.person,
            color: Colors.black12,
          ),
          activeIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          title: "第一个",
          color: Colors.black12),
    ];

    _pageController = PageController(initialPage: _currentIndex);

    _pagesView = <Widget>[
      ConversationPage(),
      new Container(
        color: Colors.black,
      ),
      new Container(
        color: Colors.blueAccent,
      ),
      new Container(
        color: Colors.green,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bar = BottomNavigationBar(
      fixedColor: Colors.green,
      items: _navigationViews
          .map<BottomNavigationBarItem>(
              (NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        setState(() {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn);
          _currentIndex = index;
        });
      },
    );

    return new Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
            child: new Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print("22222");
                  },
                ),
                PopupMenuButton(
                  onSelected: (String string) {
                    print(string);
                  },
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuItem<String>>[
                      PopupMenuItem(
                        child: _buildPopupMenuItem(
                            Icon(
                              Icons.access_alarm,
                              color: Colors.white,
                            ),
                            "提醒"),
                        value: "点击1",
                      ),
                      PopupMenuItem(
                        child: _buildPopupMenuItem(
                            Icon(
                              Icons.access_alarm,
                              color: Colors.white,
                            ),
                            "提醒"),
                        value: "点击2",
                      ),
                      PopupMenuItem(
                        child: _buildPopupMenuItem(
                            Icon(
                              Icons.access_alarm,
                              color: Colors.white,
                            ),
                            "提醒"),
                        value: "点击3",
                      ),
                      PopupMenuItem(
                        child: _buildPopupMenuItem(
                            Icon(
                              Icons.access_alarm,
                              color: Colors.white,
                            ),
                            "提醒"),
                        value: "点击4",
                      ),
                    ];
                  },
                  icon: Icon(Icons.add),
                )
              ],
            ),
          )
        ],
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pagesView[index];
        },
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemCount: _pagesView.length,
        controller: _pageController,
      ),
      bottomNavigationBar: bar,
    );
  }
}
