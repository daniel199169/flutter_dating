import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nubae/firebase_services/basic_firebase.dart';
import 'package:nubae/firebase_services/likes_manager.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List _notifications;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    getLikesData();
    _notifications = [
      {"message": "Sandy want to go on a date with you", "action": "accept"},
      {"message": "Sandy want to go on a date with you", "action": "accept"},
      {"message": "Sandy want to go on a date with you", "action": "accept"},
      {"message": "Sandy want to go on a date with you", "action": "accept"},
    ];
  }

  getLikesData() async{
     await LikesManager.getLikesData(SessionManager.getUserId());
  }

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text("Notifications"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: db
              .collection("likes")
              .where("likeduid", isEqualTo: SessionManager.getUserId())
              .snapshots(),
          builder: (context, snapshot) {
            return Container(
                width: width,
                height: height,
                child: ListView.builder(
                  itemBuilder: (context, ind) => ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                      backgroundColor: Colors.white,
                    ),
                    title: Text(
                      "${_notifications[ind]["message"]}",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: RaisedButton(
                      onPressed: () {},
                      color: Colors.orange,
                      child: Text(
                        "${_notifications[ind]["action"]}".toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  itemCount: _notifications.length,
                ));
          },
        ));
  }
}
