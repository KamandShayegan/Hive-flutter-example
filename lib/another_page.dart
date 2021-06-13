import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/tokens_methods.dart';

class Another extends StatefulWidget {
  const Another({Key key}) : super(key: key);

  @override
  _AnotherState createState() => _AnotherState();
}

class _AnotherState extends State<Another> {

  String randMaker() {
    return Random().nextInt(40).toString();
  }
  //method to generate random values

  @override
  Widget build(BuildContext context) {
    
    String rand1 = randMaker();
    String rand2 = randMaker();
    String firstToken, secondToken;
    //random values to change data of hive easier.

    try{
       firstToken = getFirstToken();
       secondToken = getSecondToken();
    }catch(e){
      print('hive is empty!');
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('If u want to use these values, you can go: \n'),
            Text("( $firstToken, $secondToken )"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('update'),
        onPressed: () {
          setState(() {
            addTokens(rand1, rand2);
            print("new values added ( $rand1, $rand2 )");
          });
        },
      ),
    );
  }
}
