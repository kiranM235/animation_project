import 'package:flutter/material.dart';

class CatImage extends StatelessWidget {
  const CatImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/cat_image.png");
  }
}
