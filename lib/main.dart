import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/another_page.dart';
import 'package:flutter_app/tokens.dart';
import 'package:flutter_app/tokens_methods.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TokensAdapter());
  await Hive.openBox<Tokens>('tokens');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Using Hive'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String randMaker() {
    return Random().nextInt(40).toString();
  }

  String rand1, rand2;

  Tokens tokensInstance = Tokens();
  @override
  Widget build(BuildContext context) {
    String firstToken='0';
    String secondToken='0';
    try {
      firstToken = getFirstToken();
      secondToken = getSecondToken();
    } catch (e) {
      print(e);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  rand1 = randMaker();
                  rand2 = randMaker();
                  setTokens(rand1, rand2);
                  firstToken = getFirstToken();
                  secondToken = getSecondToken();
                  print("added: ( $firstToken, $secondToken )");
                });
              },
              child: Text('create'),
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  firstToken = getFirstToken();
                  secondToken = getSecondToken();
                  print('( $firstToken, $secondToken )');
                } catch (e) {
                  print('hive is empty!!!');
                }
              },
              child: Text('read'),
            ),
            ElevatedButton(
              onPressed: () {
                deleteTokens();
                rand1 = randMaker();
                rand2 = randMaker();
                setTokens(rand1, rand2);
                firstToken = getFirstToken();
                secondToken = getSecondToken();
                print("added: ( $firstToken, $secondToken )");
              },
              child: Text('update'),
            ),
            ElevatedButton(
              onPressed: () {
                deleteTokens();
                print('deleted');
              },
              child: Text('delete'),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
                child: Text('Navigate to the second route'),
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Another())
                    //builder
                    ) //push
                )
          ],
        ),
      ),
    );
  }
}
