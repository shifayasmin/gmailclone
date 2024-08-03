// JoinPage.dart
import 'package:flutter/material.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Join with a code',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                show == false
                    ? Text(
                        'Join',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          print('tapped');
                        },
                        child: Text(
                          'Join',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            Text(
              'Enter the code provided by the meeting organiser',
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.black,
              ),
            ),
            TextFormField(
              onChanged: (value) {
                if (value.length > 0) {
                  setState(() {
                    show = true;
                  });
                } else {
                  setState(() {
                    show = false;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
