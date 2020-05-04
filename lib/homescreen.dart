import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class world extends StatefulWidget {
  @override
  _worldState createState() => _worldState();
}

class _worldState extends State<world> {
  @override
  Widget build(BuildContext context) {
      return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text("Hang On!!!",
        style: new TextStyle(
          color: Colors.red[700],
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
      image: Image.asset("assets/home.png", width: 700.0,),
      //backgroundGradient: new LinearGradient(colors: [Colors.cyan, Colors.blue], begin: Alignment.topLeft, end: Alignment.bottomRight),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red[900],
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cool"),
        automaticallyImplyLeading: false,
        ),
      body: new Center(
        child: new Text("Succeeded!",
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0
        ),),

      ),
    );
  }
}  
      
  
  