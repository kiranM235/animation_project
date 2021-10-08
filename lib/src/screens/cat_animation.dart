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
    return Center(
      child: InkWell(
          onTap: () {
            // check if animation is at beginning => forward
            // if animation is at the end => reverse
            if (catAnimation.status == AnimationStatus.dismissed || catAnimation.status == AnimationStatus.reverse) {
              catAnimationController.forward();
            } else {
              catAnimationController.reverse();
            }

          },
          child:Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              _buildBox(),
              _buildCatImage(),


            ],
          ),
          ),
    );
  }

  Widget _buildBox() {
    return Container(
      height: 350,
      width: 350,
      color: Colors.brown.shade200,
    );
  }

  Widget _buildCatImage() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
          animation: catAnimation,
          builder: (BuildContext context, Widget? child) {
            print("The margin ${catAnimation.value}");
            return Container(
                margin: EdgeInsets.only(top: catAnimation.value),
                child: child,
            );
          },
          child: CatImage(),
        ),
    );
    }
  }
