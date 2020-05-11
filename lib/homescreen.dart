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
      navigateAfterSeconds: new Introscreen(),
      loadingText: new Text("Hang On!!!",
        style: new TextStyle(
          color: Colors.red[700],
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
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

class Introscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("COVID-19"),
        backgroundColor: Colors.deepPurple,
        //automaticallyImplyLeading: false,
        ),
        drawer: Drawer(
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        child: Text('COVID-19', 
        style: TextStyle(
          color:Colors.white,
          fontSize: 40,
        ),),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
        ),
      ),
      ListTile(
        title: Text("India's Status"),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('State Wise Status'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context);
          },
        ),
      ],
    ),
  ),
  body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 15, 15, 15),
                    child: Text(
                      "Symptoms -",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Poppins'
                      ),
                    ),
                  ),
                  //SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/headache.png",
                          title: "Headache",
                          isActive: true,
                        ),
                        SymptomCard(
                          image: "assets/images/cough.png",
                          title: "Cough",
                        ),
                        SymptomCard(
                          image: "assets/images/fever.png",
                          title: "Fever",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 20, 20),
                    child: Text("Prevention - ",
                     style: TextStyle(
                       fontSize: 20.0,
                       fontFamily: 'Poppins'
                       ),),
                  ),
                  PreventCard(
                    text:
                        "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                    image: "assets/images/wear_mask.png",
                    title: "Wear face mask",
                  ),
                  PreventCard(
                    text:
                        "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                    image: "assets/images/wash_hands.png",
                    title: "Wash your hands",
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),  
  );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
            Image.asset(image, height: 130,),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      //margin: const EdgeInsets.only(left: 5.0,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}