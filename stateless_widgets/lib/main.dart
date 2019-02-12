import 'package:flutter/material.dart';

// 沒有 return 的function 加上 void()
void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    // Define the theme, set the primary swatch
    theme: new ThemeData(primarySwatch: Colors.green),
  ));
}

class MyApp extends StatelessWidget {
  @override
  // 還沒看過別的種類的Widget build 雖然不知道為什麼這麼寫先照用
  Widget build(BuildContext context) {
    
    // 不知道 Final 是什麼鬼
    // Declare some constants
    final double myTextSize = 30.0;
    final double myIconSize = 40.0;
    final TextStyle myTextStyle =
        new TextStyle(color: Colors.grey, fontSize: myTextSize);

    var column = new Column(
      // Makes the cards stretch in horizontal axis
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Setup the card
        new MyCard(
            // Setup the text
            title: new Text(
              "Favorite",
              style: myTextStyle,
            ),
            // Setup the icon
            icon:
                new Icon(Icons.favorite, size: myIconSize, color: Colors.red)),
        new MyCard(
            title: new Text(
              "Alarm",
              style: myTextStyle,
            ),
            icon: new Icon(Icons.alarm, size: myIconSize, color: Colors.blue)),
        new MyCard(
            title: new Text(
              "Airport Shuttle",
              style: myTextStyle,
            ),
            icon: new Icon(Icons.airport_shuttle,
                size: myIconSize, color: Colors.amber)),
        new MyCard(
            title: new Text(
              "Done",
              style: myTextStyle,
            ),
            icon: new Icon(Icons.done, size: myIconSize, color: Colors.green)),
      ],
    );
    
    // 比較一般固定的外殼 和架子 所以把主要繁複內容的 column內容分開寫在上面
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stateless Widget"),
      ),
      body: new Container(
        // Sets the padding in the main container
        padding: const EdgeInsets.only(bottom: 2.0),
        child: new Center(
          child: new SingleChildScrollView(child: column),
        ),
      ),
    );
    ;
  }
}

// 可以重複利用的 Class
// Create a reusable stateless widget
class MyCard extends StatelessWidget {
  final Widget icon;
  final Widget title;
  
  // 跟 javascript 的 constructor 一樣可以給object放進一些value或是可以執行的function在裡面
  // Constructor. {} here denote that they are optional values i.e you can use as: new MyCard()
  MyCard({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: new Card(
        child: new Container(
          padding: const EdgeInsets.all(20.0),
          child: new Column(
            children: <Widget>[this.title, this.icon],
          ),
        ),
      ),
    );
  }
}
