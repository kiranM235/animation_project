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

  late AnimationController flapAnimationController;
  late Animation<double> flapAnimation;

  ///3. override initState method
  @override
  void initState() {
    super.initState();
    ///4. Initialize catAnimationController and catAnimation
    catAnimationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
    );
    catAnimation = Tween<double>(begin: -50,end: -104).animate(
      CurvedAnimation(parent: catAnimationController, curve: Curves.linear),
    );

    flapAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    flapAnimation = Tween<double>(begin: 3.14/9, end: 3.14/6).animate(
      CurvedAnimation(parent: flapAnimationController, curve: Curves.easeIn),
    );
    flapAnimationController.repeat(reverse: true);
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
              _buildCatImage(),
              _buildBox(),
              _buildLeftFlap(),


            ],
          ),
          ),
    );
  }

  Widget _buildLeftFlap() {
    return Positioned(
      left: -10,
      top: 2,
      child: AnimatedBuilder(
        animation: flapAnimation,
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: flapAnimation.value,
            alignment: Alignment.topCenter,
            child: Container(
              height: 140,
              width: 20,
              color: Colors.red,
            ),
          );
        }
      ),
    );
  }

  Widget _buildBox() {
    return Container(
      height: 250,
      width: 250,
      color: Colors.brown.shade200,
    );
  }

  Widget _buildCatImage() {
    return AnimatedBuilder(
        animation: catAnimation,
        builder: (BuildContext context, Widget? child) {
          print("The margin ${catAnimation.value}");
          return Positioned(
              top: catAnimation.value,
              left: 0,
              right:0,
              child: child!,
          );
        },
        child: CatImage(),
      );
    }
  }
