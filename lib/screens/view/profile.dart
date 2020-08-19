import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    final width = getWidth(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(null, 100),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.transparent, spreadRadius: 5, blurRadius: 2)
          ]),
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1.0),
            child: Container(
              color: Colors.transparent,
              child: Container(
                margin: EdgeInsets.fromLTRB(25, 50, 25, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child:
                            Icon(Icons.close, color: Colors.white, size: 30)),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        width: 30,
                      ),
                    ),
                    PopupMenuButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: new BorderSide(color: Color(0xFF272D3A))),
                      itemBuilder: (_) => <PopupMenuItem<String>>[
                        new PopupMenuItem<String>(
                          child: Text('Edit',
                              style: TextStyle(color: Color(0xFF868E9C))),
                          value: 'Edit',
                          height: 40,
                        ),
                        new PopupMenuItem<String>(
                          child: Text('Delete',
                              style: TextStyle(color: Color(0xFF868E9C))),
                          value: 'Delete',
                          height: 40,
                        ),
                      ],
                      icon:
                          Icon(Icons.more_vert, size: 30, color: Colors.white),
                      onSelected: (value) async {
                        if (value == "Edit") {
                        } else if (value == "Delete") {}
                      },
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: width,
                  child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text("My Profile",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)))),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        "assets/images/placeholderProfileImage.jpg")),
              ),
              Text(
                "Amy Whitefield",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text("Guildhall School of Music and Drama",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              Text("London, UK",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Container(
                  // color: Colors.white,
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: width * 0.45 + 10,
                    height: MediaQuery.of(context).size.height * 0.4,
                    padding: EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/images/welcome0.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.2,
                        padding: EdgeInsets.only(
                            left: 0.0, right: 10.0, top: 10, bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/images/welcome1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.2,
                        padding: EdgeInsets.only(
                            left: 0.0, right: 10.0, top: 0, bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/images/welcome3.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
