import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({required this.title});



  @override
  _MyHomePageState createState() => _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double>  animation;

  @override
  void initState() {
    super.initState();
    // initialization code
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0.2,end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInBack)
    );
     // controller.forward();
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeTransition(
              opacity: animation,
              child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            ),
            RotationTransition(
              turns:animation,
              child: Container(
                width: 200,
                height:200,
                color: Colors.green,
              ),
            ),
          ScaleTransition(scale: animation,
          child: Container(
              width: 200,
              height:200,
              color:Colors.blue
          ),
          )

          ],
        ),
      ),

    );
  }
}