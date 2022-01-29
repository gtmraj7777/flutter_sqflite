import 'package:flutter/material.dart';
import 'package:sqflite_app_friends/all_friend.dart';
import 'package:sqflite_app_friends/main.dart';

import 'friend.dart';
import 'friend_database.dart';


class NewFriend extends StatefulWidget {
  const NewFriend({Key? key}) : super(key: key);

  @override
  _NewFriendState createState() => _NewFriendState();
}

class _NewFriendState extends State<NewFriend> {

  TextEditingController textEditingControllerFriendName = new TextEditingController();
  TextEditingController textEditingControllerFriendEmail = new TextEditingController();
  TextEditingController textEditingControllerFriendAddress = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Friend"),),
      body: Center(
        child: new Form(
          child: new Column(
            children: [
              new Padding(padding: EdgeInsets.only(top: 30.0)),
              new TextFormField(controller: textEditingControllerFriendName,decoration: InputDecoration(hintText : "Name"),),
              new TextFormField(controller: textEditingControllerFriendEmail,decoration: InputDecoration(hintText: "Email"),),
              new TextFormField(controller: textEditingControllerFriendAddress,decoration: InputDecoration(hintText : "Address"),),
              RaisedButton(onPressed: (){

                final friend = new Friend(friendName: "${textEditingControllerFriendName.text}", friendEmail: "${textEditingControllerFriendEmail.text}", friendAddress: "${textEditingControllerFriendAddress.text}");

                print(FriendDatabase.instance.create(friend));

                Navigator.push(context, MaterialPageRoute(builder: (context) => AllFriend()),);


              },
              child: Text("ADD"),
              )

            ],



          ),
        ),
      ),
    );
  }
}

