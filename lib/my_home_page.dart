import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFinish = false;
  bool start = false;

  final items = <Item>[];

  @override
  void initState() {
    items.addAll([
      Item(code: 'dino', photo: 'assets/dino.png'),
      Item(code: 'dino', photo: 'assets/dino.png'),
      Item(code: 'fish', photo: 'assets/fish.png'),
      Item(code: 'fish', photo: 'assets/fish.png'),
      Item(code: 'wolf', photo: 'assets/wolf.png'),
      Item(code: 'wolf', photo: 'assets/wolf.png'),
    ]);
    items.shuffle();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
        centerTitle: true,
      ),
      body: Center(child: isFinish ? toRestart() : buildBody()),
    );
  }

  Widget toRestart() {
    return GestureDetector(
      onTap: () {
        setState(() {
          items.shuffle();
          isFinish = false;
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
        child: Text(
          'Replay',
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      child: GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return start
                ? FlipCard(
                front: buildFront(),
                back: buildBack(item),)
            : buildBack(item);
          },
      itemCount: items.length,),
    );
  }

  Widget buildFront(){
    return Container(
      alignment: Alignment.center,
      child: Text('?',
      style: Theme.of(context).textTheme.headline6,),
    );
  }

  Widget buildBack(Item items){
    return Container(
      child: Image.asset(items.photo)
    );
  }

}
