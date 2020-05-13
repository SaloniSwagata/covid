import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  final String url = 'https://api.rootnet.in/covid19-in/unofficial/covid19india.org/statewise';
  Map totaldata;

  @override
  Widget build(BuildContext context) {

    Future<void> fetchData() async{
      var response = await http.get(url);
        totaldata = json.decode(response.body);  
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Country's Status",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
        ),
        ),
      body: RefreshIndicator(
              onRefresh: fetchData,
              child: FutureBuilder(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.connectionState != ConnectionState.done){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("assets/images/MASK.jpg"), fit: BoxFit.fill,)),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text('The Total Cases As On -',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10),
              child: Text(DateFormat("dd/MM/yyyy").format(DateTime.parse(totaldata['data']['lastRefreshed']).toLocal()) +"  "+ DateFormat("H:m:s").format(DateTime.parse(totaldata['data']['lastRefreshed']).toLocal()),
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
              ),
            ),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
              children: <Widget>[
                StatusPanel(
                  title: 'CONFIRMED',
                  panelColor: Colors.red,
                  textColor: Colors.white,
                  count: totaldata['data']['total']['confirmed'].toString(),
                ),
                StatusPanel(
                  title: 'ACTIVE',
                  panelColor: Colors.blue,
                  textColor: Colors.white,
                  count: totaldata['data']['total']['active'].toString(),
                ),
                StatusPanel(
                  title: 'RECOVERED',
                  panelColor: Colors.green,
                  textColor: Colors.white,
                  count: totaldata['data']['total']['recovered'].toString(),
                ),
                StatusPanel(
                  title: 'DEATHS',
                  panelColor: Colors.grey,
                  textColor: Colors.white,
                  count: totaldata['data']['total']['deaths'].toString(),
                ),
              ],
              
              ),
          ],

        ),
      );
            }
          }
              ),
      ),  
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(5),
      height: 500, width: width/2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: textColor
            ),
            ),
          ),
          Text(count, style: TextStyle(color: textColor),),
        ],
      ),
    );
  }
}