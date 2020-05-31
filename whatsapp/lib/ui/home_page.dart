import 'package:flutter/material.dart';
import 'package:whatsapp/ui/status_page.dart';
import 'package:whatsapp/ui/constants.dart';

import 'call_page.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  var fabIcon = Icons.message;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(vsync: this, length: 4);
    tabController.index = 1;
    tabController.animation
      ..addListener(() {
        setState(() {
          _currentIndex = (tabController.animation.value).round();
          switch (_currentIndex) {
            case 0:
              break;
            case 1:
              fabIcon = Icons.message;
              break;
            case 2:
              fabIcon = Icons.camera_enhance;
              break;
            case 3:
              fabIcon = Icons.call;
              break;
          }
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double othersWidth =
        (deviceWidth - (Constants.kCameraButtonWidth + (32 * 4))) / 3;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('WhatsApp'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(0.0),
            icon: Icon(Icons.search),
          ),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: tabController,
          tabs: <Widget>[
            Tab(
              child: Container(
                width: Constants.kCameraButtonWidth,
                height: Constants.kBottomTabBarHeight,
                alignment: Alignment.center,
                child: Icon(Icons.camera_alt),
              ),
            ),
            _TabItemWithText(
              width: othersWidth,
              text: "CHATS",
            ),
            _TabItemWithText(
              width: othersWidth,
              text: "STATUS",
            ),
            _TabItemWithText(
              width: othersWidth,
              text: "CALLS",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Icon(Icons.add),
          ChatPage(),
          StatusPage(),
          CallPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(fabIcon),
      ),
    );
  }
}

class _TabItemWithText extends StatelessWidget {
  final String text;
  final double width;

  _TabItemWithText({
    this.text,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: Constants.kBottomTabBarHeight,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15.0,
        ),
      ),
    );
  }
}
