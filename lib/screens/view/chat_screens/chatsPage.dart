import 'package:nubae/firebase_services/basic_firebase.dart';
import 'package:nubae/firebase_services/chat_manager.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:nubae/models/chatPart.dart';
import 'package:nubae/screens/view/custom/slideRightRoute.dart';
import 'package:nubae/screens/View/chat_screens/chatPage.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {

  bool isLoad = false;

  readMessage(String receiverID) async {
    await ChatController.readMessage(receiverID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("Users").document(SessionManager.getUserId()).collection("chats").orderBy("timestamp", descending: true).snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: Text("Loading...",
                style: TextStyle(fontSize: 20, color: Colors.grey)
              ),
            );
          }

          List<ChatPart> chatParts = new List<ChatPart>();
          snapshot.data.documents.forEach((document) {
            chatParts.add(ChatPart.fromJson(document.data));
          });
          
          if(chatParts.length > 0){
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(top: 50, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Matches", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Expanded(
                    child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.separated(
                        primary: true,
                        separatorBuilder: (context,ind)=> Container(height: 1, color: Colors.grey[300],),
                        itemCount: chatParts.length,
                        itemBuilder: (BuildContext context, int index){
                          return MaterialButton(
                            padding: EdgeInsets.all(0),
                            onPressed: (){
                              Navigator.push(
                                context,
                                SlideRightRoute(page: ChatPage(
                                  chatID: chatParts[index].chatID,
                                  receiverID: chatParts[index].uid,
                                  receiverImage: chatParts[index].image,
                                  receiverName: chatParts[index].name
                                )),
                              ).then((value) {
                                if(chatParts[index].unseenCount > 0){
                                  readMessage(chatParts[index].uid);
                                }
                              });
                              if(chatParts[index].unseenCount > 0){
                                readMessage(chatParts[index].uid);
                              }
                            },
                            child: Container(
                              height: 90,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 70,
                                    height: 70,
                                    child: chatParts[index].image == null || chatParts[index].image == "" 
                                      ? Center(child: Text(chatParts[index].name[0], style: TextStyle(fontSize: 25, color: Colors.white),)) 
                                      : CircleAvatar(
                                        backgroundImage: NetworkImage(chatParts[index].image)
                                      ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      color: Colors.blue
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(chatParts[index].name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                                          SizedBox(height: 5,),
                                          Flexible(
                                            child: Text(
                                              chatParts[index].lastMessage,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(color: Colors.grey)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(timeago.format(chatParts[index].timestamp.toDate()), style: TextStyle(color: Colors.grey),),
                                  SizedBox(width: 10),
                                  chatParts[index].unseenCount > 0
                                  ? Badge(
                                    badgeContent: Text(
                                      chatParts[index].unseenCount.toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                  : Container() 
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } 
          else {
            return Center(
              child: Text("There are no Matches yet",
                style: TextStyle(fontSize: 20, color: Colors.grey)
              ),
            );
          }
        },
      ),
    );
  }
}
