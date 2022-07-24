import 'package:flip_card/flip_card.dart';
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
  bool start = false;
  int previousIndex = -1;
  bool wait = false;
  // List<bool> cardFlips;
  late List<GlobalKey<FlipCardState>> cardStateKeys;
  FlipCardController _controller;

  List<GlobalKey<FlipCardState>> getCardStateKeys() {
    List<GlobalKey<FlipCardState>> cardStateKeys = [];
    for (int i = 0; i < listImage().length ; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
    return cardStateKeys;
  }

  final List<Data> data = [
    Data(key: '1', images: Image.asset('assets/dino.png')),
    Data(key: '1', images: Image.asset('assets/dino.png')),
    Data(key: '2', images: Image.asset('assets/fish.png')),
    Data(key: '2', images: Image.asset('assets/fish.png')),
    Data(key: '3', images: Image.asset('assets/frog.png')),
    Data(key: '3', images: Image.asset('assets/frog.png')),
    Data(key: '4', images: Image.asset('assets/octo.png')),
    Data(key: '4', images: Image.asset('assets/octo.png')),
    Data(key: '5', images: Image.asset('assets/rabbit.png')),
    Data(key: '5', images: Image.asset('assets/rabbit.png')),
    Data(key: '6', images: Image.asset('assets/wolf.png')),
    Data(key: '6', images: Image.asset('assets/wolf.png')),
  ];

  List<Widget> listImage() {
    return data.map((e) => e.images).toList();
  }

  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.all(4.0),
      child: listImage()[index],
    );
  }

  void restart() {
    data.shuffle();
    isFinish = false;
    start = true;
  }

  @override
  void initState() {
    data.shuffle();
    isFinish = false;
    start = true;
    // TODO: implement initState
    super.initState();
    _controller: FlipCardController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flip Cards Game'),
        centerTitle: true,
      ),
      body: isFinish
          ? Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              restart();
            });
          },
          child: Container(
            height: 50,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Text(
              "Replay",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      )
          : SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) => start
                      ? FlipCard(
                      controller: _controller,
                      front: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        margin: const EdgeInsets.all(4.0),
                        child: Text(
                          '?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      back: getItem(index))
                      : getItem(index),
                  itemCount: listImage().length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
