import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      color: const Color.fromARGB(10, 255, 255, 255),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const SampleWidget(),
      ),
    );
  }
}
class MyStateFulWidget extends StatefulWidget {
  const MyStateFulWidget({Key? key}) : super(key: key);

  @override
  State<MyStateFulWidget> createState() => _MyStateFulWidgetState();
}

class _MyStateFulWidgetState extends State<MyStateFulWidget> {
  int sizeValue = 0;
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
         showModalBottomSheet<void>(
                  isScrollControlled: true,
                  barrierColor: const Color.fromARGB(0, 255, 255, 255),
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: sizeValue == 0? size.height*0.3 : size.height*0.5 ,
                      color: Colors.amber,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text('Modal BottomSheet'),
                            ElevatedButton(
                              onPressed:() {
                                setState(() {
                                  sizeValue = 1;
                                });
                              },
                              child: const Text('위로')),
                            ElevatedButton(
                              onPressed: (() {
                                Navigator.pop(context);
                                setState(() {
                                  sizeValue = 0;
                                });
                              }),
                              child: const Text('Close BottomSheet')
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            barrierColor: const Color.fromARGB(0, 255, 255, 255),
            context: context,
            builder: (BuildContext context) {
              return Container(
                height:  size.height*0.3,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
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
    return Scaffold(appBar: AppBar(title: const Text("dkldkdk")),
    body: Stack(
      
      children: [
        Container(color: Colors.amber),

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
        value >= 3? Container(color: Colors.black54): Container(),

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


class SampleWidget extends StatefulWidget {
  const SampleWidget({Key? key}) : super(key: key);

  @override
  State<SampleWidget> createState() => _SampleWidgetState();
}

class _SampleWidgetState extends State<SampleWidget> {
   final List<Map> _products = List.generate(
      100,
      (index) => {
            "id": index,
            "name": "Product $index",
            "price": Random().nextInt(100)
          }).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KindaCode.com'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: _products.length,
          itemBuilder: (BuildContext ctx, index) {
            return GridTile(
              key: ValueKey(_products[index]['id']),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  _products[index]['name'],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("\$${_products[index]['price'].toString()}"),
                trailing: const Icon(Icons.shopping_cart),
              ),
              child: Image.network(
                'https://www.kindacode.com/wp-content/uploads/2021/12/phone.jpeg',
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}