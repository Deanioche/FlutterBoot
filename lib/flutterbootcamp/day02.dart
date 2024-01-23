// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:math';

class Day02 extends StatefulWidget {
  const Day02({super.key});

  @override
  _GaugeWidgetState createState() => _GaugeWidgetState();
}

class _GaugeWidgetState extends State<Day02>
    with SingleTickerProviderStateMixin {
  double _progress = 0;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    Future.doWhile(() async {
      await Future.delayed(Duration(milliseconds: 15));
      setState(() {
        _progress = max(0, _progress - 0.03);
      });
      if (_progress == 0) {
        _score = 0;
      }
      return true;
    });
  }

  void _startAnimation() {
    if (_progress < 1) {
      setState(() {
        _progress += min(0.3, 1 - _progress);
      });
    }
    if (_progress > 0.9) {
      setState(() {
        _score += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        _showScore(),
        _expandedPanel(),
      ]),
    );
  }

  Widget _showScore() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Text(
            'Your score',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Text(
            _score.toString(),
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _expandedPanel() {
    return Expanded(
      child: Container(
        constraints: BoxConstraints.expand(),
        child: _showGauge(),
      ),
    );
  }

  Widget _showGauge() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 20, bottom: 20),
          child: Column(
            children: [
              Container(
                width: 40,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  color: Colors.black,
                ),
                child: CustomPaint(
                  painter: GaugePainter(
                    progress: _progress,
                  ),
                ),
              ),
              SizedBox(height: 8),
              FloatingActionButton(
                onPressed: _startAnimation,
                child: const Icon(Icons.add, size: 30),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GaugePainter extends CustomPainter {
  double _progress;

  GaugePainter({required double progress}) : _progress = progress {
    _progress = progress;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple;
      // ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0, size.height, size.width, -(size.height * _progress)),
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
