import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Center(
              child: Stack(
                fit: StackFit.passthrough,
                clipBehavior: Clip.none,

                children: <Widget>[
                  Icon(
                    Icons.library_music_rounded
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.red,
                  ), //Container
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Colors.black,
                    ),
                  ), //Container
                  Positioned(
                    left: 40,
                    top: 40,
                    child: Container(
                      height: 300,
                      width: 300,
                      color: Colors.purple,
                    ),
                  ), //Container
                ], //<Widget>[]
              ), //Stack
            ), //Center
          ), //SizedB
        ),
      ),
    );
  }
}
