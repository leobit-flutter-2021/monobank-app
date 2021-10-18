import 'package:flutter/material.dart';

void main() => runApp(ScreeNavigationBarnBackground());

class ScreeNavigationBarnBackground extends StatelessWidget {
  ScreeNavigationBarnBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

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
                        child: const Text("dads"),
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
                  //ToDO Here should be scrolling butons
                ),
              ],
            )),
        Expanded(
          flex: 8,
          child: Container(
            width: screenWidth,
            color: const Color(0xFFf4f4f4),
            child: const Text("adsa"),
          ),
        )
      ],
    );
  }
}
