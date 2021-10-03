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
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _change = false;
  double _end = 400;
  void _incrementCounter() {
    setState(() {
      _counter++;
      _change = !_change;
    });
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
            // Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            // AnimatedContainer(
            //   duration: Duration(seconds:1),
            //   curve:Curves.easeIn,
            //   width:_change ? 200 : 100,
            //   height: _change ? 200 : 100,
            //   color: _change ? Colors.green : Colors.red,
            // ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 100.0, end:_end),
              onEnd: () {
                if( _end <=0 ) return;
                setState(() {
                  _end  = _end - 50;
                });
              },
              duration: Duration(seconds: 3),
              builder: (context,double value, child){
                print(value);
                return Container(
                  width: value,
                  height: value,
                  color: Colors.blue,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}