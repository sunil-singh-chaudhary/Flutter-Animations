// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ZoomSnapList extends StatefulWidget {
  const ZoomSnapList({super.key});

  @override
  _ZoomSnapListState createState() => _ZoomSnapListState();
}

class _ZoomSnapListState extends State<ZoomSnapList> {
  late PageController _pageController;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.8;
    var height = width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoom Snap List'),
      ),
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        pageSnapping: true,
        scrollBehavior: MaterialScrollBehavior(),
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: 10, // Replace with your actual item count
        itemBuilder: (context, index) {
          // Replace this container with your custom list item widget
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Transform.scale(
              scale: _currentPage == index ? 1.0 : 0.8,
              child: Image.asset(
                  'assets/card${index + 1}.png', // Replace with your image URL
                  height: height,
                  width: width),
            ),
          );
        },
      ),
    );
  }
}
