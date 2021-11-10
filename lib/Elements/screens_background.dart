// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:monobank_app/actions.dart';
import 'package:monobank_app/states.dart';

class ScreeNavigationBarBackground extends StatefulWidget {
  var child1;

  var child2;

  List buttonsInfo;
  ScreeNavigationBarBackground(
      {Key? key, this.child1, this.child2, required this.buttonsInfo})
      : super(key: key);

  @override
  _ScreeNavigationBarBackgroundState createState() =>
      _ScreeNavigationBarBackgroundState(
        child1: child1,
        child2: child2,
        buttonsInfo: buttonsInfo,
      );
}

class _ScreeNavigationBarBackgroundState
    extends State<ScreeNavigationBarBackground> {
  String jar_name = "";
  int jar_amount = 0;
  int jar_first_transaction = 0;
  double newCash = 0.0;

  var child1;

  var child2;

  List buttonsInfo;
  _ScreeNavigationBarBackgroundState(
      {this.child1, this.child2, required this.buttonsInfo})
      : super();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    Widget _buttonItem(buttonInfo) {
      return StoreConnector<CashState, dynamic>(
        converter:  (store) {
      return (newCash, jar_amount,jar_first_transaction,jar_name) => store.dispatch(MakeBankSaving(newCash, jar_amount,jar_first_transaction,jar_name));
    }, 
        builder: (context, cashInfo) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(500)),
            width: 250,
            height: 150,
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(8)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ))),
              onPressed: () {
                showDialog(
                    context: context,
                    // builder: (BuildContext context) {
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              right: -40.0,
                              top: -40.0,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const CircleAvatar(
                                  child: Icon(Icons.close),
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: new InputDecoration(
                                        hintText: "Jar name."),
                                    onChanged: (String str) {
                                      setState(() {
                                        jar_name = str;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: new InputDecoration(
                                        hintText: "first transaction"),
                                    onChanged: (String str) {
                                      setState(() {
                                        jar_first_transaction = int.parse(str);
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration:
                                        new InputDecoration(hintText: "Amount"),
                                    onChanged: (String str) {
                                      setState(() {
                                        jar_amount = int.parse(str);
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    child: Text("Submitß"),
                                    onPressed: () {
                                      // double newCash = cashInfo.cash - jar_first_transaction.toDouble();
                                      cashInfo(0.0, jar_amount,jar_first_transaction,jar_name);
                                      Navigator.of(context).pop();
                                      // store
                                      // if (_formKey.currentState.validate()) {
                                      //   _formKey.currentState.save();
                                      // }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              },
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
        },
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

// class ScreeNavigationBarBackground extends StatelessWidget {
  

  

//   @override
//   Widget build(BuildContext context) {

   