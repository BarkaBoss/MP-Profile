import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:profile/main.dart';

class DataPage extends StatefulWidget {
  String? name;
  String? position;
  String? imageSixFour;
  String? staffID;
  String? dateOfBirth;
  String? gender;

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

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                Card(
                  elevation: 20,
                  shadowColor: Colors.black26,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Image.memory(
                        const Base64Decoder()
                            .convert(widget.imageSixFour.toString()),
                        width: 300,
                      )
                    ]),
                  ),
              ),
              Card(
                elevation: 20,
                shadowColor: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 10, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(widget.name.toString()),
                      Text(widget.staffID.toString()),
                      Text(widget.position.toString()),
                      Text(widget.dateOfBirth.toString()),
                      Text(widget.gender.toString()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
