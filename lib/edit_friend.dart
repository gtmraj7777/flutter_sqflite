
import 'package:flutter/material.dart';
import 'package:sqflite_app_friends/all_friend.dart';

import 'friend.dart';
import 'friend_database.dart';
import 'main.dart';

class EditFriend extends StatefulWidget {
  //const EditFriend(Friend friend, {Key? key}) : super(key: key);

  late Friend friend;

  EditFriend(this.friend);

  @override
  _EditFriendState createState() => _EditFriendState();
}

class _EditFriendState extends State<EditFriend> {

  TextEditingController textEditingControllerFriendName = new TextEditingController();
  TextEditingController textEditingControllerFriendEmail = new TextEditingController();
  TextEditingController textEditingControllerFriendAddress = new TextEditingController();

  late String name;
  late String email;
  late String address;




  @override
  void initState() {
    super.initState();
    textEditingControllerFriendName.text = widget.friend.friendName;
    textEditingControllerFriendEmail.text = widget.friend.friendEmail;
    textEditingControllerFriendAddress.text = widget.friend.friendAddress;

    //  name = widget.friend?.friendName ?? '';
    // email = widget.friend?.friendEmail ?? '';
    // address = widget.friend?.friendAddress ?? '';


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Friend"),),
      body: Center(
        child: new Form(
          child: new Column(
            children: [
              new Padding(padding: EdgeInsets.only(top: 30.0)),
              new TextFormField(controller: textEditingControllerFriendName,decoration: InputDecoration(hintText : "Name"),),
              new TextFormField(controller: textEditingControllerFriendEmail,decoration: InputDecoration(hintText: "Email"),),
              new TextFormField(controller: textEditingControllerFriendAddress,decoration: InputDecoration(hintText : "Address"),),
              RaisedButton(onPressed: (){

               // final friend = new Friend(friendName: "${textEditingControllerFriendName.text}", friendEmail: "${textEditingControllerFriendEmail.text}", friendAddress: "${textEditingControllerFriendAddress.text}");

                //print(FriendDatabase.instance.create(friend));

                //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);

                print(widget.friend.friendName);

              //Friend friend = Friend(friendName: textEditingControllerFriendName.text, friendEmail: textEditingControllerFriendEmail.text, friendAddress: textEditingControllerFriendAddress.text);

               // widget.friend.friendName = textEditingControllerFriendName.text;

                print(widget.friend.id);

                upDate();
                Navigator.push(context, MaterialPageRoute(builder: (context) => AllFriend()),);

              },
                child: Text("SAVE CHANGE"),
              )
            ],

          ),
        ),
      ),
    );
  }

  Future upDate() async{


    final friend22 = widget.friend.copy(
      friendName: textEditingControllerFriendName.text,
      friendEmail: textEditingControllerFriendEmail.text,
      friendAddress: textEditingControllerFriendAddress.text,
    );



    await FriendDatabase.instance.update(friend22);

  }
}

