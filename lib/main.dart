import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Transition Route'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Vamos'),
            onPressed: () {
              Navigator.of(context).push(_createroute());
            },
          ),
        ),
      ),
    );
  }

  Route _createroute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Page2(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.easeInCirc;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          //var offsetAnimation = animation.drive(tween);
          return SlideTransition(
              position: animation.drive(tween), child: child);
        });
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.white,
          height: 35.0,
          child: FadeInImage(
            fadeInCurve: Curves.easeIn,
            fadeOutCurve: Curves.easeOut,
            placeholder: NetworkImage(
                'https://www.bolsacr.com/sites/all/themes/bolsacr/logo.png'),
            image: NetworkImage(
                'https://www.bolsacr.com/sites/all/themes/bolsacr/logo.png'),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Animations'),
      ),
    );
  }
}
