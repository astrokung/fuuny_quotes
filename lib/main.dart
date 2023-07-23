import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quotesList = [
    'ธรรมะแท้ไม่มีคำปลอบใจ มีแต่ความจริงซึ่งคนโง่ยอมรับไม่ได้',
    'จ๊ะเอ๋ตัวเอง !',
    'พบกับธรรมะ กระตุกจิต กระชากใจ',
    'ใครฆ่าอารยา ?',
    'พวกท่านทั้งหลาย หวาดกลัวยุคสมัยใหม่ขนาดนั้นเลยเหรอ',
  ];
  static const List<Color> colorList = [
    Colors.yellow,
    Colors.black,
    Colors.green,
    Colors.purple,
    Colors.blue,
    Colors.pinkAccent,
  ];

  var quote = quotesList[0];
  var color = colorList[0];

  int ChackQuote = 0;
  int ChackColor = 0;

  void handleClickGo() {
    setState(() {
      var randIndex = 0;
      var randIncolor = 0;

      for (;;) {
        randIndex = Random().nextInt(quotesList.length);
        randIncolor = Random().nextInt(colorList.length);
        if (randIndex != ChackQuote && randIncolor != ChackColor) {
          break;
        }
      }
      quote = quotesList[randIndex];
      color = colorList[randIncolor];

      ChackQuote = randIndex;
      ChackColor = randIncolor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('คำคม/แคปชั่นกวนๆ')),
      floatingActionButton: FloatingActionButton(
        child: Text('Next Quote'),
        onPressed: handleClickGo,
      ),
      body: Center(
        child: Text(
          quote,
          style: TextStyle(
              color: color,
              fontSize: 30,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
