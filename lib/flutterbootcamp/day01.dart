import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget day01() {
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FlutterBoot Plus',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      const SizedBox(height: 30),
                      SingleChildScrollView(
                          child: Column(children: [
                        Column(
                          children: [
                            _showItem(Icons.bolt, 'Preminum features',
                                'Plus subscribers have access to FlutterBoot+ and out latest beta features'),
                            _showItem(Icons.whatshot, 'Priority access',
                                'You\'ll be able to use FlutterBoot+ even when demand is high'),
                            _showItem(Icons.speed, 'Ultra-fast',
                                'Enjoy even faster response speeds when using FlutterBoot'),
                          ],
                        ),
                      ])),
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Restore subscription",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                  "Auto-renews for \$25/month until canceled",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  )),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                      ),
                                      child: Text(
                                        'Subscribe',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ]),
                      )
                    ],
                  )))));
}

Widget _showItem(IconData icon, String title, String subtitle) {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50.0,
            height: 50.0,
            child: Icon(
              icon,
              size: 40.0,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ))
            ],
          )
        ],
      ));
}
