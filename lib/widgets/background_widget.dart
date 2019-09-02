import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_clone/widgets/header_painter.dart';

class BackgroundWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _BackgroundWidgetState();

}

class _BackgroundWidgetState extends State<BackgroundWidget> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;
  Animation<Offset> animationStarOffset;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 10000), 
      vsync: this,
    );
    animation = Tween(
      begin: 0.0,
      end: 345.0,
    ).animate(controller)..addListener((){
      setState((){});
    });
    var beginOffset = Offset(290.0, 0.0);
    var endOffset = _getEndOffset(beginOffset);
    animationStarOffset = Tween<Offset>(begin: beginOffset, end: endOffset).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment(0.5, 0.94),
        children: <Widget>[
          CustomPaint(
            painter: HeaderPainter(animation.value, animationStarOffset.value),
            child: Container(height: 345.0,),
          ),
          Image.asset('assets/reindeer.png', scale: 15.0),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _getRandomBeginOffset() {
    var dy = 0.0;
    var dx = Random().nextInt(345).toDouble();
    return Offset(dx, dy);
  }

  _getEndOffset(Offset beginOffset){
    var radians = 30.0 * pi / 180;
    var dy = 345.0;
    var dx = beginOffset.dx - dy * cos(radians) / sin(radians);
    return Offset(dx, dy);
  }

}