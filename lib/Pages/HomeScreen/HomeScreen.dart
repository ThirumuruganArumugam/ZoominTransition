// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  /* CONTAINER ZOOM IN AND ZOOM OUT */

  late AnimationController _controller;
  late Animation _color;
  late Animation _container;
  late Animation<double> _logo;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.addListener(() {
      setState(() {});
    });
    _color =
        ColorTween(begin: Colors.amber, end: Colors.brown).animate(_controller);

    _container = Tween(begin: 10.0, end: 200.0).animate(_controller);

    _logo = Tween<double>(begin: 30.0, end: 300.0).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _container.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _logo.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: Center(
        child: Stack(children: [
          Center(
            child: AnimatedContainer(
              height: _container.value,
              width: _container.value,
              duration: const Duration(seconds: 2),
              color: _color.value,
              curve: Curves.easeOutBack,
            ),
          ),
          Center(
            child: AnimatedContainer(
              height: _logo.value,
              width: _logo.value,
              curve: Curves.easeOutBack,
              duration: const Duration(seconds: 1),
              child: const FlutterLogo(size: 100),
            ),
          ),
        ]),
      ),
    );
  }
}
