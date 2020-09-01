import 'package:nubae/firebase_services/basic_firebase.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:nubae/models/chat.dart';
import 'package:nubae/models/chatPart.dart';
import 'package:nubae/models/message.dart';
import 'package:nubae/models/typingStatus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatController {
  static Future<String> createNewChat(
      String chatID, String receiverID, String message) async {
    String currentChatID;
    await db
        .collection("Users")
        .document(SessionManager.getUserId())
        .collection("chats")
        .document(receiverID)
        .get()
        .then((doc) async {
      if (doc.exists) {
        currentChatID = ChatPart.fromJson(doc.data).chatID;
        sendMessage(
            currentChatID,
            receiverID,
            Message(
                content: message,
                senderID: receiverID,
                type: "text",
                timestamp: Timestamp.now()));
      } else {
        currentChatID = chatID;
        await db.collection("Chats").document(chatID).setData({
          "id": chatID,
          "members": [SessionManager.getUserId(), receiverID],
          "messages": [
            Message(
                    content: message,
                    senderID: receiverID,
                    type: "text",
                    timestamp: Timestamp.now())
                .toJson()
          ],
          "typingStatuses": [
            TypingStatus(memberID: SessionManager.getUserId(), isTyping: false)
                .toJson(),
            TypingStatus(memberID: receiverID, isTyping: false).toJson(),
          ],
          "ownerID": SessionManager.getUserId()
        });
      }
    });
    return currentChatID;
  }

  static Future<void> sendMessage(
      String chatID, String receiverID, Message message) async {
    await db.collection("Chats").document(chatID).updateData({
      "messages": FieldValue.arrayUnion([message.toJson()])
    });

    await db
        .collection("Users")
        .document(receiverID)
        .collection("chats")
        .document(SessionManager.getUserId())
        .updateData({
      "lastMessage": message.content,
      "timestamp": message.timestamp,
      "unseenCount": FieldValue.increment(1)
    });

    await db
        .collection("Users")
        .document(SessionManager.getUserId())
        .collection("chats")
        .document(receiverID)
        .updateData({
      "lastMessage": message.content,
      "timestamp": message.timestamp,
    });
  }

  static Future<void> updateTypingStatus(String chatID, bool isTyping) async {
    db.collection("Chats").document(chatID).get().then((doc) async {
      Chat chat = Chat.fromJson(doc.data);
      List<TypingStatus> typingStatuses = chat.typingStatuses;
      typingStatuses.forEach((typingStatus) {
        if (typingStatus.memberID == SessionManager.getUserId()) {
          typingStatus.isTyping = isTyping;
        }
      });
      await db.collection("Chats").document(chatID).updateData({
        "typingStatuses": typingStatuses
            .map((typingStatus) => typingStatus.toJson())
            .toList(),
      });
    });
  }

  static Future<void> readMessage(String receiverID) async {
    await db
        .collection("Users")
        .document(SessionManager.getUserId())
        .collection("chats")
        .document(receiverID)
        .updateData({"unseenCount": 0});
  }
}
