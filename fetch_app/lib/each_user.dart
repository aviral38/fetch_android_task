import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class userWidget extends StatefulWidget {
  userWidget({required this.id,required this.name});
  String id;
  String name;


  @override
  State<userWidget> createState() => _userWidgetState();
}

class _userWidgetState extends State<userWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 10),
      height: height/15,
      width: width/25,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text('id: ${widget.id}',style: TextStyle(fontFamily: 'Schyler',fontWeight: FontWeight.w600),),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text('name: ${widget.name}',style: TextStyle(fontFamily: 'Schyler',fontWeight: FontWeight.w600),),
          )
        ],
      ),
    );

  }
}
