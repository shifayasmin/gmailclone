import 'package:gmailclone/Screen/Tabs/MailTab.dart';
import 'package:gmailclone/Screen/Tabs/MeetTab.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            MailTab(),
            MeetTab(),
          ],
        ),
        bottomNavigationBar: Container(
          height: 50,
          child: TabBar(
              indicatorColor: Colors.deepPurple,
              unselectedLabelColor: Colors.grey,
              controller: _controller,
              labelColor: Color.fromARGB(255, 10, 10, 10),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Icon(
                  Icons.mark_email_unread_outlined,
                ),
                Icon(
                  Icons.video_call,
                ),
              ]),
        ),
      ),
    );
  }
}
