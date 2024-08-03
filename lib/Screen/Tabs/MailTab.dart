import 'package:flutter/material.dart';
import 'package:gmailclone/Screen/DetailScreen.dart';
import 'package:gmailclone/Utilities/list_info.dart';

class MailTab extends StatefulWidget {
  const MailTab({super.key});

  @override
  _MailTabState createState() => _MailTabState();
}

class _MailTabState extends State<MailTab> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(95, 131, 128, 128),
        elevation: 0,
        title: Container(
          child: TextFormField(
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: 'Search in email'),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: const CircleAvatar(
              backgroundImage: AssetImage(
                'images/logo.png',
              ),
            ),
          )
        ],
      ),
      drawer: const Drawer(
        child: Column(
          children: [Text('Gmail')],
        ),
      ),
      body: Container(
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: ListView.builder(
              itemCount: infoList.length,
              itemBuilder: (build, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailPage(
                                  detail: infoList[index],
                                )));
                  },
                  child: Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Container(
                            child: infoList[index].logo.isEmpty
                                ? Text(
                                    infoList[index].userName.substring(0, 1),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage(infoList[index].logo)),
                                      shape: BoxShape.circle,
                                    ),
                                  )),
                      ),
                      title: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    infoList[index].userName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    infoList[index].time,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(infoList[index].title.length > 20
                                            ? '${infoList[index]
                                                    .title
                                                    .substring(0, 20)}....'
                                            : infoList[index].title),
                                        Text(
                                          infoList[index].description,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      icon: Icon(infoList[index].isStared
                                          ? Icons.star
                                          : Icons.star_border_outlined),
                                      onPressed: () {
                                        setState(() {
                                          infoList[index].isStared =
                                              !infoList[index].isStared;
                                        });
                                      })
                                ],
                              )),
                            ]),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
