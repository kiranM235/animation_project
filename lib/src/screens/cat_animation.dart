import 'package:animation/src/widgets/cat_images.dart';
import 'package:flutter/material.dart';

class CatAnimation extends StatefulWidget {
  const CatAnimation({Key? key}) : super(key: key);

  @override
  _CatAnimationState createState() => _CatAnimationState();
}
///1. Use with TickerProviderStateMixin
class _CatAnimationState extends State<CatAnimation> with TickerProviderStateMixin{
  ///2. Define Animation and AnimationController

  late AnimationController catAnimationController;
  late Animation<double> catAnimation;

  ///3. override initState method
  @override
  void initState() {
    super.initState();
    ///4. Initialize catAnimationController and catAnimation
    catAnimationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
    );
    catAnimation = Tween<double>(begin: 0,end: 100).animate(
      CurvedAnimation(parent: catAnimationController, curve: Curves.linear),
    );
  }




  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print("cat image is clicked");
          catAnimationController.forward();
        },
        child: _buildCatImage(),
    );
  }

  Widget _buildCatImage() {
    return AnimatedBuilder(
        animation: catAnimation,
        builder: (BuildContext context, Widget? child) {
          return Container(
              margin: EdgeInsets.only(top: catAnimation.value),
              child: CatImage());
      },
    );
  }
}
