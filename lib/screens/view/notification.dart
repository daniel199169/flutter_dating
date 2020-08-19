import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';

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

    _notifications = [
      {
        "message": "Sandy want to go on a date with you",
        "action": "accept"
      },{
        "message": "Sandy want to go on a date with you",
        "action": "accept"
      },{
        "message": "Sandy want to go on a date with you",
        "action": "accept"
      },{
        "message": "Sandy want to go on a date with you",
        "action": "accept"
      }
      ,
    ];

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
          onPressed: ()=> Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("Notifications"),
      ),
        body: Container(
          width: width,
          height: height,
          child: ListView.builder(itemBuilder: (context,ind)=> ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
              backgroundColor: Colors.white,
            ),
            title: Text("${_notifications[ind]["message"]}",style: TextStyle(color: Colors.white),),
            trailing: RaisedButton(
              onPressed: (){

              },
              color: Colors.orange,
              child: Text("${_notifications[ind]["action"]}".toUpperCase(),style: TextStyle(color: Colors.white),),
            ),
          ),
          itemCount: _notifications.length,
          )

        ));
  }
}
