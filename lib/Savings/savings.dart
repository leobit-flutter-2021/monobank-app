import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:monobank_app/states.dart';
import '../Elements/screens_background.dart';
import '../Elements/consts.dart';

void main() {
  runApp(const SavingsPage());
}

class SavingsPage extends StatefulWidget {
  const SavingsPage({Key? key}) : super(key: key);

  @override
  _SavingsPageState createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
  Widget _upperText() {
    return StoreConnector<CashState, dynamic>(
      converter: (store) => store.state,
      builder: (context, cashInfo) {
        return Container(
          // height: MediaQuery.of(context).size.,
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      "Накопичення в гривнях",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    alignment: Alignment.bottomRight,
                    child: const Icon(
                      Icons.info_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  (cashInfo.savingsTotalAmount.toString() + " \$"),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _savingsInfo() {
    Widget _sectionTitle() {
      return Container(
        height: 50,
        margin: const EdgeInsets.only(left: 10, bottom: 10),
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Банки",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              "У гривні 9200 HRN",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    Widget _sectionInfo(cashInfo) {
      Widget _bankaElement(jarInfo) {
        return Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: ClipOval(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFFc7598a),
                          Color(0xFFf18d8b),
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: const Icon(
                    Icons.accessible_forward_sharp,
                    size: 30,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width - 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        jarInfo["name"],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(jarInfo["total_amount"].toString()),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: Colors.blue),
                    ),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - 70,
                    height: 10,
                    child: LinearProgressIndicator(
                      // value: 0.7,
                      value:
                          jarInfo["current_amount"] / jarInfo["total_amount"],
                    ),
                  ),
                  Text(
                    "Накопичено " + jarInfo["current_amount"].toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }

      return Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        height: MediaQuery.of(context).size.height / 3 * 2 - 100,
        child: ListView(
            children: cashInfo.jars
                .map<Widget>((e) => (Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: _bankaElement(e))))
                .toList()),
      );
    }

    return StoreConnector<CashState, dynamic>(
        converter: (store) => store.state,
        builder: (context, cashInfo) {
          return Container(
            child: Column(
              children: [
                _sectionTitle(),
                _sectionInfo(cashInfo),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final cashbackList = [
      {'icon': Icon(Icons.favorite_outlined), 'text': 'Передавати на благо'},
      {'icon': Icon(Icons.archive), 'text': 'Архів'},
      {'icon': Icon(Icons.save_alt), 'text': 'Вивести'}
    ];
    return ScreeNavigationBarBackground(
      child1: _upperText(),
      child2: _savingsInfo(),
      buttonsInfo: cashbackList,
    );
  }
}
