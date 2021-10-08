import 'package:animation/src/screens/cat_animation.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Animation",
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Animation"),
            centerTitle: true,
          ),
          body: CatAnimation(),
      ),
      ),
    );
  }
}
