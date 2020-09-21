import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  List _data = [
    {
      "name": "1",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);

    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text("Subscription"),
        ),
        backgroundColor: Colors.black,
        body: Container(
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            height: height * 0.7,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                  onTap: () {},
                  child: new GridTile(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Get our premium plans",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27,
                                    color: Colors.orange)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Text("1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24)),
                          ),
                          Text("Month", style: TextStyle(fontSize: 24)),
                          Text("\$5.95 ", style: TextStyle(fontSize: 24)),
                          SizedBox(
                            height: 30,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            onPressed: () {},
                            color: Colors.orange,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            )));
  }
}

class ViewOffer extends StatefulWidget {
  final details;
  ViewOffer(this.details);

  @override
  _ViewOfferState createState() => _ViewOfferState();
}

class _ViewOfferState extends State<ViewOffer> {
  List _notifications;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _notifications = [
      {"message": "Sandy want to go on a date with you", "action": "accept"},
      {"message": "Sandy want to go on a date with you", "action": "accept"},
      {"message": "Sandy want to go on a date with you", "action": "accept"},
      {"message": "Sandy want to go on a date with you", "action": "accept"},
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
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text("View Offer"),
        ),
        body: Container(
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
            )));
  }
}
