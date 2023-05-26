import 'package:card_animation/card_animation/constants.dart';
import 'package:card_animation/card_animation/utils.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatefulWidget {
  final int index;
  final double offsets;

  const CreditCard({super.key, required this.index, required this.offsets});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;
    debugPrint("width-without 0.8-> ${MediaQuery.of(context).size.width}");
    debugPrint("width--> $cardWidth");
    double cardHeight =
        (cardWidth * ratio) + cardMargin; //margin 32 , ratio 0.6
    debugPrint("card height--> $cardHeight");

    double height = MediaQuery.of(context).size.height - 64;
    debugPrint("height--> $height");

    double position = (widget.index) * cardHeight - widget.offsets;
    double isDisappearing = -cardHeight;
    double isTop = 0;
    double isBottom = height - cardHeight;
    double isAppearing = height;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Transform.translate(
        offset: const Offset(0, 10),
        child: Center(
          child: Transform.scale(
            scale: getAnimatedScale(
                position, isDisappearing, isTop, isBottom, isAppearing),
            child: Opacity(
              opacity: getAnimatedOpacity(
                  position, isDisappearing, isTop, isBottom, isAppearing),
              child: Image.asset(
                'assets/card${widget.index + 1}.png',
                width: cardWidth,
                height: cardWidth * ratio,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
