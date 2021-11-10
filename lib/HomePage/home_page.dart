import 'package:flutter/material.dart';
import 'package:monobank_app/actions.dart';
import 'package:monobank_app/monobank_icons.dart';
import '../Elements/navigation_bar.dart';
import 'package:intl/intl.dart';
import '../models.dart';

import 'package:flutter_redux/flutter_redux.dart';
import '../Elements/screens_background.dart';
import '../states.dart';

Color whiteColor = Colors.orange;
Color purpleColor = Colors.deepPurple;
final oCcy = new NumberFormat("#,##0.00", "en_US");

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'taxi';
  int transactionAmount = 0;

  Widget _moneyBar() {
    return StoreConnector<CashState, dynamic>(
        converter: (store) => store.state,
        builder: (context, cashInfo) {
          return Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "${oCcy.format(cashInfo.cash)} ${cashInfo.currency}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        });
  }

  Widget _transactionsView(elements, context) {
    return StoreConnector<CashState, dynamic>(
        converter: (store) => store.state,
        builder: (context, cashInfo) {
          List<Widget> newTransactions = [];
          for (Transaction transaction in cashInfo.transactions.reversed) {
            newTransactions.add(_transactionCard(transaction));
          }
          return Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: elements + newTransactions,
              ),
            ),
          );
        });
  }

  Widget _transactionCard(Transaction transaction) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 40, right: 40),
      child: Container(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(transaction.icon),
              _transactionText(transaction.text, transaction.receiver),
              Spacer(),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${transaction.money}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ))
            ],
          )),
    );
  }

  Widget _transactionText(String text, String destination) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            destination,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget _dateTime(String date) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _dateTimeMain(context, String date) {
    return StoreConnector<CashState, dynamic>(converter: (store) {
      return (transactionAmount, dropdownValue) => store.dispatch(
          MakeTransaction(transactionAmount.toDouble(), dropdownValue));
    }, builder: (context, cashInfo) {
      return Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 25,
          right: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
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
                                  child: CircleAvatar(
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
                                          hintText: "Amount"),
                                      onChanged: (String str) {
                                        setState(() {
                                          transactionAmount = int.parse(str);
                                        });
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: DropdownButton<String>(
                                      value: dropdownValue,
                                      icon: const Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: const TextStyle(
                                          color: Colors.deepPurple),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                        });
                                      },
                                      items: <String>[
                                        'product',
                                        'taxi',
                                        'other'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      child: Text("Make transaction"),
                                      onPressed: () {
                                        cashInfo(transactionAmount, dropdownValue);
                                        Navigator.of(context).pop();
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
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black)),
                  child: Icon(Icons.bar_chart_sharp),
                )),
            Text(
              date,
              style: TextStyle(fontSize: 12),
            ),
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black)),
              child: Icon(Icons.search_outlined),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.centerLeft,
                colors: [whiteColor, purpleColor])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _moneyBar(),
            _transactionsView([
              _dateTimeMain(context, "Kurwa, gdzie pieniadze"),
            ], context)
          ],
        ),
      ),
    );
  }
}
