import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:profile/main.dart';

class DataPage extends StatefulWidget {

  String ?name;
  String ?position;
  String ?imageSixFour;
  String ?staffID;
  String ?dateOfBirth;
  String ?gender;

  DataPage({
    required this.staffID,
    required this.name,
    required this.position,
    required this.dateOfBirth,
    required this.gender,
    required this.imageSixFour,
  });

  @override
  State<StatefulWidget> createState() => _DataPageState();
}
class _DataPageState extends State<DataPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
              const MyApp()
            ));
          },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
          ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Image.memory(Base64Decoder().convert(widget.imageSixFour.toString())),
          Text(widget.name.toString()),
          Text(widget.staffID.toString()),
          Text(widget.position.toString()),
          Text(widget.dateOfBirth.toString()),
          Text(widget.gender.toString()),
        ],
      ),
    );
  }

}