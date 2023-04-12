import 'dart:async';

import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  final int time;
  final Offset offset;
  final Widget child;
  const AnimationWidget(
      {Key? key, required this.time, required this.child, required this.offset})
      : super(key: key);

  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    final curve =
        CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _animation =
        Tween<Offset>(begin: widget.offset, end: Offset.zero).animate(curve);
    Timer(Duration(milliseconds: widget.time), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _animation,
        child: widget.child,
      ),
    );
  }
}
