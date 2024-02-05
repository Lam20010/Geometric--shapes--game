//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/itemModel.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
@override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  //var player = AudioCache();
  late List<ItemModel> items;
  late List<ItemModel> items2;
  late int score;
  late bool gameOver;

  get white => null;
initGame() {
gameOver = false;
score = 0;
items = [
      ItemModel(value: 'assets/squareM.png', name: 'square' , img: 'assets/square.png'),
      ItemModel(value: 'assets/rectangleM.png', name: 'rectangle' , img: 'assets/rectangle.png'),
      ItemModel(value: 'assets/irculeM.png', name: 'circule' , img: 'assets/ircule.png'),
      ItemModel(value: 'assets/triangleM.png', name: 'triangl' , img: 'assets/triangl.png'),
];
items2 = List<ItemModel>.from(items);
items.shuffle();//  يعرض الاشكال بشكل عشوائي كل مره
items2.shuffle();
}
 
  @override
 void initState(){
  super.initState();
  initGame();
 }

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) gameOver = true;
   // var teal;//
    return Scaffold( 
  body: SafeArea (
    child: SingleChildScrollView(
      child: Column ( 
        children: [
          Padding(
            padding: const EdgeInsets.all (15.0),
            child: Text.rich(
              TextSpan (
                children: [ 
                  TextSpan (
                    text: 'Score: ',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),// TextSpan
                  TextSpan (
                    text: '$score',
                    style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.teal),
                  ),
        ],
              ),
            ),
          ),
          if(!gameOver)
          Row(
            children: [
              const Spacer(), 
              Column(
               /* children: items.map((item) {
                  return Container (
                    margin: const EdgeInsets.all(8),
                    child: Draggable<ItemModel> (
                    data: item,
                    childWhenDragging: CircleAvatar(
                      backgroundColor: Colors white,
                      backgroundImage:AssetImage(item.img),
                     radius: 50,
                     ),// CircleAvatar
                    feedback: CircleAvatar(
                      backgroundColor: Colors white, 
                      backgroundImage: AssetImage(item.img), 
                      radius: 30,
                      ),// CircleAvatar
                      child Circlevatan(
                      backgroundColor: Colors white, 
                      backgroundImage: AssetImage(item.img), 
                      radius: 30,
                      ),
                    ),
                  );,
                }),*/
              ),
              Spacer (flex: 2),
              Column (
children: items2.map((item) {
return DragTarget<ItemModel> (
onAccept: (receivedItem) {
if(item.value == receivedItem.value) {
setState(() {
items.remove(receivedItem);
items2.remove(item);
});
score += 10;
item.accepting = false;
//player.play('true.wav');
} else {
setState(() {
score -= 5;
item.accepting = false;
//player.play('false.wav');
});
}
},
onWillAccept: (receivedItem) {
setState(() {
item.accepting = true;});
return true;
},
onLeave: (receivedItem) {
setState(() {
 item.accepting = false;
});
},
builder: (context, acceptedItems, rejectedItems) =>
Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(8), 
color: item.accepting
       ? Colors.grey[400]
       : Colors.grey[200],
), 
alignment: Alignment.center,
 height:
 MediaQuery.of(context).size.width / 6.5,
  width: MediaQuery.of(context).size.width / 3,
margin: EdgeInsets.all(8)
/*child:Text (
  item.name,
   style:
Theme.of(context).textTheme.titleLarge,
)*/),//Text, Container
);// DragTarc&
  }).toList(),
), // Column
Spacer(),
            ],
          ),//Row
if (gameOver)
Center (
 child: Column(
 children:[
  Padding(
padding: const EdgeInsets.all(8.0),
  child: Text(
' Game Over',
style: Theme.of(context).textTheme.titleLarge!.copyWith()
//fontWeight: FontWeight.bold, color: Colors.red
),// Text
),// Padding
Padding (
padding: const EdgeInsets.all(8.0),
 child: Text( 
  result(),
style: Theme.of(context) .textTheme.displaySmall,
),// Text
),
 ],
 ),
),
if (gameOver)
Container (
height: MediaQuery.of(context).size.width / 10, decoration: BoxDecoration( color: Colors.teal,
borderRadius: BorderRadius. circular (8)),
child: TextButton( 
  onPressed:(){
setState({
initGame()
} as VoidCallback);
},
child: Text(
'New Game',
style: TextStyle(color: Colors.white),
)),
)
],
),
),
),
);
}

String result(){
if (score==100){
 // player.play('success.wav');
  return 'أحسنت بارك الله فيك';
}else{
 // player.play('tryAgain.wav');
  return 'العب مره اخرى لتحصل على درجه اعلى';
}
}
}
