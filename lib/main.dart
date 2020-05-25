import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  _currentTime() {
    return "${DateTime.now().hour}:${DateTime.now().minute}";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animationController.addListener(() {
      if(animationController.isCompleted){
        animationController.reverse();
      }else if(animationController.isDismissed){
        animationController.forward();
      }
      setState(() {

      });

    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween(begin: -0.5,end: 0.5).animate(animation);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Clock'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          color: Colors.orange,
          child: Center(
            child: Column(
              children: <Widget>[
                Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.blue,
                  child: Container(
                    width: 320,
                    height: 320,
                    child: Center(
                      child: Text(
                        _currentTime(),
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Transform(
                  alignment: FractionalOffset(0.5,0.0),
                  transform: Matrix4.rotationZ(animation.value),

                  child: Container(
                    child: Image.asset(
                      'images/pandulum.png',
                      width: 100,
                      height: 250,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
