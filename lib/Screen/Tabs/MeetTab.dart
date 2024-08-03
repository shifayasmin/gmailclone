import 'package:flutter/material.dart';
import 'package:gmailclone/Screen/JoinPage.dart';

class MeetTab extends StatefulWidget {
  MeetTab({Key? key}) : super(key: key);

  @override
  _MeetTabState createState() => _MeetTabState();
}

class _MeetTabState extends State<MeetTab> {
  late PageController _controller;

  int page = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width; // Corrected line

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Meet',
          style: textStyle,
        ),
      ),
       drawer: const Drawer(
        child: Column(
          children: [Text('Gmail')],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showSheet(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 10, 10, 10),
                    ),
                    child: Text(
                      'New meeting',
                      style: TextStyle(color: const Color.fromARGB(255, 248, 247, 247)),),
                    ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => JoinPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Join with a code',
                    style: TextStyle(color: Color.fromARGB(255, 10, 10, 10),),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: PageView(
                onPageChanged: (p) {
                  setState(() {
                    page = p;
                  });
                },
                controller: _controller,
                children: [
                  buildContainer(
                    height,
                    width,
                    image: 'images/3437284.png',
                  ),
                  buildContainer(
                    height,
                    width,
                    image: 'images/meet2.png',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          index == page ? Color.fromARGB(255, 248, 178, 157) : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer(double height, double width,
      {required String image}) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 100),
          Image.asset(
            image,
            height: height /4,
            width: width,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 100),
          Container(
            child: Text(
              'Get a link that you can share',
              style: textStyle,
            ),
          ),
          SizedBox(height: 40),
          Container(
            child: Text(
              'Tap New meeting to get a link that you can send topeople that you want to meet with',
              style: greyText,
            ),
          ),
        ],
      ),
    );
  }

  TextStyle textStyle = TextStyle(
    fontSize: 18.0,
    color: Colors.black,
  );

  TextStyle greyText = TextStyle(
    fontSize: 12.0,
    color: Colors.grey,
  );

  showSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.all(15),
        height: 200,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            container(
              icon: Icons.link_outlined,
              text: 'Get a meeting link to share',
            ),
            container(
              icon: Icons.videocam_outlined,
              text: 'Start an instant meeting',
            ),
            container(
              icon: Icons.calendar_today,
              text: 'Schedule in Google Calendar',
            ),
                      ],
        ),
      ),
    );
  }

  Container container({required IconData icon, required String text}) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            size: 22,
            color: Colors.grey,
          ),
          SizedBox(width: 50),
          Text(
            text,
            style: greyText,
          ),
        ],
      ),
    );
  }
}
