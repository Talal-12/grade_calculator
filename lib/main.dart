import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grade Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scoreController = TextEditingController();

  String result = "";

  void calculateResult() {
    double score = double.parse(scoreController.text);
    if (score >= 90) {
      result = "A";
      print(result);
    } else if (score >= 80) {
      result = "B";
      print(result);
    } else if (score >= 70) {
      result = "C";
      print(result);
    } else if (score >= 60) {
      result = "D";
      print(result);
    } else if (score < 50) {
      result = "F";
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grade Calculator"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: scoreController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.percent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  labelText: 'Type your score',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  calculateResult();
                });
              },
              child: Text(
                "Calculate",
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            Container(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                result,
                style: TextStyle(
                    fontSize: 75,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}
