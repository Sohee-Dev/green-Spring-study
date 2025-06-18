import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '가위바위보',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: '가위바위보 게임'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<String> rspList = ['✌', '✊', '🖐'];
  int com_ListNum = 0;
  int user_ListNum = 0;

  int draw = 0;
  int lose = 0;
  int win = 0;
  int total = 0;

  String result = "";

  bool showImage = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _rspGame(int user) {
    var random = Random();

    int com = random.nextInt(3) + 1;

    setState(() {
      total++;
      if(total == 0){
        showImage = true;
      }
      else{
        showImage = false;
      }

      if (com == 1) {
        com_ListNum = 0;
      } else if (com == 2) {
        com_ListNum = 1;
      } else if (com == 3) {
        com_ListNum = 2;
      }

      if (user == 1) {
        user_ListNum = 0;
      } else if (user == 2) {
        user_ListNum = 1;
      } else if (user == 3) {
        user_ListNum = 2;
      }
    });

    if ((user == 1 && com == 3) ||
        (user == 2 && com == 1) ||
        (user == 3 && com == 2)) {
      result = "승리!🎉";
      win++;
    } else if ((user == 1 && com == 2) ||
        (user == 2 && com == 3) ||
        (user == 3 && com == 1)) {
      result = "패배😥";
      lose++;
      total++;
    } else {
      result = "무승부😂";
      draw++;
      total++;
    }
  }

  void _restart() {
    setState(() {
      result = "재도전!!";
      com_ListNum = 0;
      user_ListNum = 0;

      draw = 0;
      lose = 0;
      win = 0;
      total = 0;
      showImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[100],
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(offset: Offset(2, 2), color: Colors.grey)],
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "COM",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink[400],
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: 
                showImage ? Image.asset('hachiiware.png', width: 120, height: 120,) :
                            Text(rspList[com_ListNum], style: TextStyle(fontSize: 80)),
            ),
            SizedBox(height: 50),
            Text(
              "VS",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: 
              showImage ? Image.asset('chiikawa.png', width: 120, height: 120,) :
                          Text(rspList[user_ListNum], style: TextStyle(fontSize: 80)),
            ),
            SizedBox(height: 10),
            Text(
              "YOU",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink[400],
              ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _rspGame(1);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[100],
                    overlayColor: Colors.red[200],
                  ),
                  child: Text(
                    '가위',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(offset: Offset(2, 2), color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 70),
                ElevatedButton(
                  onPressed: () {
                    _rspGame(2);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[100],
                    overlayColor: Colors.red[200],
                  ),
                  child: Text(
                    '바위',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(offset: Offset(2, 2), color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 70),
                ElevatedButton(
                  onPressed: () {
                    _rspGame(3);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[100],
                    overlayColor: Colors.red[200],
                  ),
                  child: Text(
                    '보',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(offset: Offset(2, 2), color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              result,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('[ 전적 ]', style: TextStyle(fontSize: 20)),
            Text(
              '$total전 / $win승 / $draw무 / $lose패',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _restart,
        tooltip: 'Restart',
        child: const Icon(Icons.restart_alt),
      ),
    );
  }
}
