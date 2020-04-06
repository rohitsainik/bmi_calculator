import 'package:flutter/material.dart';


class helpDesk extends StatefulWidget {
  @override
  _helpDeskState createState() => _helpDeskState();
}

class _helpDeskState extends State<helpDesk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HELP"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            SizedBox(height: 25.0,),
            Container(
              height: MediaQuery.of(context).size.height-400,
              width: MediaQuery.of(context).size.width-15.0,
              alignment: Alignment.topCenter,
              color: Colors.black12,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: <Widget>[
                  Center(child: Text("Body Mass Index Status",style: TextStyle(fontSize: 20.0,color: Colors.blueAccent),)),
                  SizedBox(height: 10.0,),
                  ListTile(
                    title: Text("1. Below 18.5	Underweight",style: TextStyle(fontSize: 15.0,color: Colors.pinkAccent))
                  ),
                  ListTile(
                        title: Text("2. 18.5 – 24.9	Great Shape",style: TextStyle(fontSize: 15.0,color: Colors.pinkAccent),)
                    ),
                   ListTile(
                        title: Text("3. 25.0 – 29.9	Overweight",style: TextStyle(fontSize: 15.0,color: Colors.pinkAccent),)
                    ),
                   ListTile(
                        title:  Text("4. 30.0 and Above	Obese",style: TextStyle(fontSize: 15.0,color: Colors.pinkAccent),)
                    ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
