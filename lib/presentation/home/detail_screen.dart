import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music/models/music_model.dart';
import 'package:music/utils/utils.dart';

class DetailScreen extends StatelessWidget {
  final Music data;
  const DetailScreen({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        // centerTitle: true,
        shadowColor: Colors.black,
        elevation: 5,
        leading: null,
        title: const Text(
          "Details",
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: Column(children: [
        Image.network(
          data.img,
          height: 200,
          width: sW(context),
          fit: BoxFit.cover,
        ),
        spaceHeight(10),
        Text(
          data.trackName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        spaceHeight(10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.type_specimen,
                size: 25,
                color: Colors.grey,
              ),
              spaceWidth(2),
              Text(data.gener,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        spaceHeight(20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.person_2_outlined,
                size: 25,
                color: Colors.grey,
              ),
              spaceWidth(2),
              Text(data.artisit,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data.description,
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
        ),
      ]),
    );
  }
}
