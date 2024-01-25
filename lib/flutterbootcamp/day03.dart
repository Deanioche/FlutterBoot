// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Day03();
  }
}

class Day03 extends StatelessWidget {
  const Day03({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('I can layout this', style: TextStyle(fontSize: 20)),
            backgroundColor: Colors.red,
          ),
          body: Container(
            color: Colors.black,
            child: Column(
              children: [
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                    ),
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) => _gridItem(index))),
                Expanded(
                    child: Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        color: Colors.yellow,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.brown,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _gridItem(int index) {
  switch (index) {
    case 0:
      return Container(
        color: Colors.grey,
      );
    case 1:
      return Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      );
    case 2:
      return Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.white,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.green,
            ),
          ),
        ],
      );
    case 3:
      return Column(children: [
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 5),
              color: Colors.yellow,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.white,
          ),
        ),
      ]);
    default:
      {
        return Container(
          color: Colors.white,
        );
      }
  }
}
