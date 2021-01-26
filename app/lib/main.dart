import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Card(),
      debugShowCheckedModeBanner: false,
    ));

class Card extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  String name = '';
  String currentAge = '';
  String email = '';
  String picture = 'assets/default.jpg';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('App id'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMyDialog();
        },
        child: Icon(
          Icons.edit,
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('$picture'),
                  radius: 60.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.grey[800],
                  child: Icon(Icons.camera_alt),
                  onPressed: () {
                    selectPicture();
                  },
                ),
              ],
            )),
            Divider(
              height: 40.0,
              color: Colors.grey[800],
            ),
            Text(
              'Name',
              style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '$name',
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Current age',
              style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '$currentAge',
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  child: Icon(
                    Icons.email,
                    color: Colors.grey[400],
                  ),
                ),
                Text(
                  '$email',
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18.0,
                      letterSpacing: 1.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void selectPicture() {
    var dir = new Directory('assets');
    List contents = dir.listSync();
    print(contents);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[600],
          content: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            child: Text(
                              'Day picture',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.lightBlue[300],
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                picture = contents[0].toString().substring(7);
                                picture = picture.replaceAll("'", "");
                                picture = picture.replaceAll("\\", "/");
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            child: Text(
                              'Night picture',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.lightBlue[300],
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                picture = contents[2].toString().substring(7);
                                picture = picture.replaceAll("'", "");
                                picture = picture.replaceAll("\\", "/");
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            child: Text(
                              'Person picture',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.lightBlue[300],
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                picture = contents[3].toString().substring(7);
                                picture = picture.replaceAll("'", "");
                                picture = picture.replaceAll("\\", "/");
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                          child: FloatingActionButton(
                            backgroundColor: Colors.red,
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showMyDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[600],
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: '$name',
                          decoration: InputDecoration(
                            icon: Icon(Icons.edit, color: Colors.amberAccent),
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.amberAccent),
                          ),
                          onSaved: (String formName) {
                            name = formName;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: '$currentAge',
                          decoration: InputDecoration(
                            icon: Icon(Icons.edit, color: Colors.amberAccent),
                            labelText: 'Current age',
                            labelStyle: TextStyle(color: Colors.amberAccent),
                          ),
                          onSaved: (String formAge) {
                            currentAge = formAge;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: '$email',
                          decoration: InputDecoration(
                            icon: Icon(Icons.alternate_email,
                                color: Colors.amberAccent),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.amberAccent),
                          ),
                          onSaved: (String formEmail) {
                            email = formEmail;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                  backgroundColor: Colors.grey[900],
                                  child: Text("Save"),
                                  onPressed: () {
                                    setState(() {
                                      _formKey.currentState.save();
                                    });
                                    Navigator.pop(context);
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  80.0, 0.0, 0.0, 0.0),
                              child: FloatingActionButton(
                                backgroundColor: Colors.red,
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
