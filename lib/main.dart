import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String textfromFile = 'Empty';

  LoadHtml() async {
    String response;
    response = await rootBundle.loadString('text/index.html');
    setState(() {
      textfromFile = response;
    });
  }

  LoadText() async {
    String response;
    response = await rootBundle.loadString('text/new.txt');
    setState(() {
      textfromFile = response;
    });
  }

  getData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$textfromFile",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                LoadHtml();
              },
              child: Text("Load Html File"),
            ),
            ElevatedButton(
              onPressed: () {
                LoadText();
              },
              child: Text("Load Text File"),
            ),
          ],
        ),
      ),
    );
  }
}
