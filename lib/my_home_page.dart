// import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'data.dart';
// import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flip = false;
  bool isFinish = false;
  final List<Data> data = [
    Data(key: '1', images: Image.asset('/assets/dino.png')),
    Data(key: '1', images: Image.asset('/assets/dino.png')),
    Data(key: '2', images: Image.asset('/assets/fish.png')),
    Data(key: '2', images: Image.asset('/assets/fish.png')),
    Data(key: '3', images: Image.asset('/assets/frog.png')),
    Data(key: '3', images: Image.asset('/assets/frog.png')),
    Data(key: '4', images: Image.asset('/assets/octo.png')),
    Data(key: '4', images: Image.asset('/assets/octo.png')),
    Data(key: '5', images: Image.asset('/assets/rabbit.png')),
    Data(key: '5', images: Image.asset('/assets/rabbit.png')),
    Data(key: '6', images: Image.asset('/assets/wolf.png')),
    Data(key: '6', images: Image.asset('/assets/wolf.png')),
  ];

  @override
  
  // Widget getItem(int index) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.blue,
  //       borderRadius: BorderRadius.circular(5),
  //     ),
  //     margin: EdgeInsets.all(4.0),
  //     child: Image.asset(data[index]),
  //   );
  // }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flip Cards Game'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(4.0),
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
              itemBuilder: (context, index){
            return data.map<Widget>((e) => e.images);
              },
          itemCount: data.length,),
        )
        );

  }
}

