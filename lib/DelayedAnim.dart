//Animation du contenu
import 'package:flutter/material.dart';
import 'dart:async';

class DelayedAnim extends StatefulWidget {
  final Widget child;
  final int delay;
  const DelayedAnim({required this.delay, required this.child});
  @override
  _DelayeAnimState createState() => _DelayeAnimState();
}

class _DelayeAnimState extends State<DelayedAnim>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animOffset;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );

    _animOffset = Tween<Offset>(
      begin:Offset(
        0.0,
        0.35,
      ),
      end: Offset.zero,
    ).animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}