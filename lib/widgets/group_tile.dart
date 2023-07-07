import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../pages/chat_page.dart';

class GroupTile extends StatefulWidget {
  final String username;
  final String groupId;
  final String groupName;

  const GroupTile({Key?key,required this.groupId,required this.groupName,required this.username}):super(key: key);

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        nextScreen(context,  ChatPage(
          groupId: widget.groupId,
          groupName: widget.groupName,
          username: widget.username,
        ));

      },
    child: Container(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).primaryColor,
          child: Text(widget.groupName.substring(0,1).toUpperCase(),textAlign: TextAlign.center,
          style:const  TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
        ),
      ),
      title: Text(widget.groupName,style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text("Join the conversation as ${widget.username}",style: const TextStyle(fontSize: 13),),
    ),),);
  }
}