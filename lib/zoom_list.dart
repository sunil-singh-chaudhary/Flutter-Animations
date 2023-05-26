import 'package:flutter/material.dart';

class ZoomList extends StatefulWidget {
  const ZoomList({super.key});

  @override
  _ZoomListState createState() => _ZoomListState();
}

class _ZoomListState extends State<ZoomList> {
  late ScrollController _scrollController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // _scrollController.addListener(
    //   () {
    //     final newIndex = (_scrollController.offset / 200).round();
    //     if (_currentIndex != newIndex) {
    //       setState(() {
    //         _currentIndex = newIndex;
    //       });
    //     }
    //   },
    // );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoom List'),
      ),
      body: ListView.builder(
        physics: PageScrollPhysics(),
        itemCount: 6, // Replace with your actual item count
        itemBuilder: (context, index) {
          // Replace this container with your custom list item widget
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(
              'assets/card${index + 1}.png', // Replace with your image URL
              height: 200,
              width: double.infinity * 0.8,
            ),
          );
        },
      ),
    );
  }
}
