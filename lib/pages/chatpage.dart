import 'package:chatapp/constant.dart';
import 'package:chatapp/pages/groupinfo.dart';
import 'package:chatapp/messagetile.dart';
import 'package:chatapp/services/databaseservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ChatPage extends StatefulWidget {
   final String groupId;
  final String groupName;
  final String userName;
  const ChatPage(
      {Key? key,
      required this.groupId,
      required this.groupName,
      required this.userName})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String admin = '';
  Stream<QuerySnapshot>? chats;
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    getChatandAdmin();
    super.initState();
  }

  getChatandAdmin() {
    DatabaseService().getChats(widget.groupId).then((val) {
      setState(() {
        chats = val;
      });
    });
    DatabaseService().getGroupAdmin(widget.groupId).then((val) {
      setState(() {
        admin = val;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(widget.groupName),
      centerTitle: true,
       actions: [
          IconButton(
              onPressed: () {
                nextScreen(
                    context,
                    GroupInfo(
                      groupId: widget.groupId,
                      groupName: widget.groupName,
                      adminName: admin,
                    ));
              },
              icon: const Icon(Icons.info))
        ],
    ),
    body: Stack(
      children: [
        chatMessages(),
        Container(
          alignment: Alignment.bottomCenter,
       width: MediaQuery.of(context).size.width, 
       child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
        color: Colors.grey.shade700,
        child: Row(
          children: [
            Expanded(child: TextFormField(
              controller: messageController,
              style: TextStyle(color: Colors.white,),
              decoration: InputDecoration(
                hintText: 'Send messages',
                hintStyle: TextStyle(
                  color: Colors.white,fontSize: 16
                ),
                border: InputBorder.none
              ),
            )),
            SizedBox(width: 20,),
            GestureDetector(
              onTap: (){
                sendMessage();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
                ),
                width: 50,
                child: Center(
                  child: Icon(Icons.send,),
                ),
              ),
            )
          ],
        ),
       ),  
        )
      ],
    ),

    );
  }
  chatMessages(){
    return StreamBuilder(
      stream: chats,
      builder: (context,AsyncSnapshot snapshot) {
      return snapshot.hasData ? ListView.builder(
        itemCount: snapshot.data.docs.length,
        itemBuilder: (context, index) {
        return MessageTile(
          image: '',
           message: snapshot.data.docs[index]['message'],
                      sender: snapshot.data.docs[index]['sender'],
                      sentByMe: widget.userName ==
                          snapshot.data.docs[index]['sender']);
      },):Container();
    },); 
  }
  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "message": messageController.text,
        "sender": widget.userName,
        "time": DateTime.now().millisecondsSinceEpoch,
      };

      DatabaseService().sendMessage(widget.groupId, chatMessageMap);
      setState(() {
        messageController.clear();
      });
    }
  }
}