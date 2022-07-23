import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    int value = 2;
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    print(size);
    return Scaffold(appBar: AppBar(title: const Text("dkldkdk")),body: Stack(
      children: [
          Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  value = 1;
                });
              },
              child: Container(
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.teal),
                  child: const Center(
                    child: Text(
                      'Show Bottom Sheet'
                    ),
                  )),
            ),
          ),
          AnimatedContainer(
            transform: Matrix4.translationValues(
                0,
                value == 0
                    ? size.height
                    : value == 1
                        ? size.height * 0.8
                        : value == 2
                            ? size.height * 0.6
                            : value == 3
                                ? size.height * 0.4
                                : value == 4
                                    ? size.height * 0.2
                                    : value == 5
                                        ? 0
                                        : size.height,
                0),
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: Colors.teal),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (value > 5) {
                          value = 0;
                        }
                        value++;
                      });
                    },
                    child: const Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      setState(() {
                        value--;
                      });
                    },
                    child: const Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
    ),);
  }
}
