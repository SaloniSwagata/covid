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
        //automaticallyImplyLeading: false,
        ),
      body: GridView.count(
  primary: false,
  padding: const EdgeInsets.all(40),
  crossAxisSpacing: 10,
  mainAxisSpacing: 20,
  crossAxisCount: 1,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('He\'d have you all unravel at the'),
      color: Colors.teal[100],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Heed not the rabble'),
      color: Colors.teal[200],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Sound of screams but the'),
      color: Colors.teal[300],
    ),
    Container(
      padding: const EdgeInsets.all(20),
      child: const Text('Who scream'),
      color: Colors.teal[400],
    ),
   ],
   ),
    drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}  
      
  
  