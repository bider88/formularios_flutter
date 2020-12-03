import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _createWallpaper(context)
        ],
      )
    );
  }

  Widget _createWallpaper(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final wallpaper =  Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 118, 1),
          ]
        )
      ),
    );

    final circle = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );

    return Stack(
      children: [
        wallpaper,
        Positioned(top: 90, left: 30, child: circle),
        Positioned(top: -40, right: -30, child: circle),
        Positioned(bottom: -50, right: -10, child: circle),
        Positioned(bottom: 120, right: 20, child: circle),
        Positioned(bottom: -50, left: -20, child: circle),
        Container(
          padding: EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Icon(Icons.account_circle, color: Colors.white, size: 100,),
              SizedBox(height: 10, width: double.infinity,),
              Text('Fake Login', style: TextStyle(color: Colors.white, fontSize: 25))
            ],
          ),
        )
      ],
    );
  }
}