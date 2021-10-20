import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScreeNavigationBarBackground extends StatelessWidget {
  var child1;

  var child2;

  List buttonsInfo;

  ScreeNavigationBarBackground(
      {Key? key, this.child1, this.child2, required this.buttonsInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    Widget _buttonItem(buttonInfo) {
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(500)),
        width: 250,
        height: 150,
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(8)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                      ))),
          onPressed: () {},
          child: Row(
            children: [
              CircleAvatar(child: buttonInfo['icon']),
              Container(
                  width: 100,
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    buttonInfo["text"],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  )),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: screenWidth,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF3366FF),
                                Color(0xFF00CCFF),
                              ],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: child1,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: const Color(0xFFf4f4f4),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 5.3),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: buttonsInfo.map((e) => _buttonItem(e)).toList(),
                  ),
                ),
              ],
            )),
        Expanded(
          flex: 8,
          child: Container(
            width: screenWidth,
            color: const Color(0xFFf4f4f4),
            child: child2,
          ),
        )
      ],
    );
  }
}
