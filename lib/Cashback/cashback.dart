import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../Elements/screens_background.dart';
import '../states.dart';

void main() {
  runApp(const CashbackPage());
}

class CashbackPage extends StatefulWidget {
  const CashbackPage({Key? key}) : super(key: key);

  @override
  _CashbackPageState createState() => _CashbackPageState();
}

class _CashbackPageState extends State<CashbackPage> {
  Widget _bankCashbackItem(e, state) {
    var currentCashback;
    if (e['type'] == 'product') {
      currentCashback = state.cashbackProducts;
    } else if (e['type'] == 'taxi') {
      currentCashback = state.cashbackTaxi;
    } else {
      currentCashback = state.cashbackElse;
    }
    return Container(
      padding: const EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Image.asset(e["image"]),
            width: 40,
            height: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 130,
            margin: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    e["main_text"],
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  e["desc_text"],
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              currentCashback.toString() + '₴',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bankCashback() {
    var bankContainerItems = [
      {
        "image": 'lib/assets/images/cashback_apple.png',
        "main_text": "Продукти",
        "desc_text": "1% кредитні, 3% власні",
        "type": "product"
      },
      {
        "image": 'lib/assets/images/cashback_taxi.png',
        "main_text": "Таксі",
        "desc_text": "1% кредитні, 2% власні",
        "type": "taxi"
      },
      {
        "image": 'lib/assets/images/cashback_taxi.png',
        "main_text": "Інше",
        "desc_text": "1% кредитні, 2% власні",
        "type": "else"
      },
    ];
    return StoreConnector<CashState, dynamic>(
        converter: (store) => store.state,
        builder: (context, cashInfo) {
          return Container(
            height: MediaQuery.of(context).size.height / 4 + 11,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 13, bottom: 13),
                    child: const Text(
                      "Кешбек від банку",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5.3,
                    child: ListView(
                        children: bankContainerItems
                            .map((e) => (_bankCashbackItem(e, cashInfo)))
                            .toList()))
              ],
            ),
          );
        });
  }

  Widget _partnersCashback() {
    final partnersCashbackItems = [
      {
        "image": 'lib/assets/images/cashback_eldorado.png',
        "main_text": "ELDORADO",
        "desc_text": "5%",
      },
      {
        "image": 'lib/assets/images/cashback_eva.png',
        "main_text": "EVA.UA",
        "desc_text": "8% на онлайн купівлі",
      },
      {
        "image": 'lib/assets/images/cashback_rocket.png',
        "main_text": "Rocket",
        "desc_text": "7% на перше замовлення",
      },
    ];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 13),
                  child: const Text(
                    "Кешбек від партнерів",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  )),
              Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(right: 10),
                child: const Text(
                  "Див. усі",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.only(left: 8, right: 8),
              height: MediaQuery.of(context).size.height / 3.2 - 33,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                  children: partnersCashbackItems
                      .map((e) => (_partnersCashbackItem(e)))
                      .toList()))
        ],
      ),
    );
  }

  Widget _partnersCashbackItem(e) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Image.asset(e["image"]),
            width: 40,
            height: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    e["main_text"],
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  e["desc_text"],
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Image.asset('lib/assets/images/ok.png'),
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _cashback() {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: [_bankCashback(), _partnersCashback()],
      ),
    );
  }

  Widget _upperBar() {
    return StoreConnector<CashState, dynamic>(
        converter: (store) => store.state,
        builder: (context, cashInfo) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Баланс кешбеку',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                    // margin: const EdgeInsets.only(top: 20),
                    child: Column(
                  children: [
                    Text(
                      'Накопичено ' +
                          (cashInfo.cashbackProducts +
                                  cashInfo.cashbackTaxi +
                                  cashInfo.cashbackElse)
                              .toString() +
                          '₴',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    getRemainingCashback(cashInfo)
                  ],
                ))
              ],
            ),
          );
        });
  }
  Widget getRemainingCashback(cashInfo){
    return 0 < (100 -
        (cashInfo.cashbackProducts +
            cashInfo.cashbackTaxi +
            cashInfo.cashbackElse)) ? Text(
      'Залишилося ' +
          (100 -
              (cashInfo.cashbackProducts +
                  cashInfo.cashbackTaxi +
                  cashInfo.cashbackElse))
              .toString() +
          '₴, щоб вивести гроші на свій рахунок',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ) : Container();
  }
  @override
  Widget build(BuildContext context) {
    final cashbackList = [
      {'icon': Icon(Icons.favorite_outlined), 'text': 'Передавати на благо'},
      {'icon': Icon(Icons.archive), 'text': 'Архів'},
      {'icon': Icon(Icons.save_alt), 'text': 'Вивести'}
    ];
    return ScreeNavigationBarBackground(
      child1: _upperBar(),
      child2: _cashback(),
      buttonsInfo: cashbackList,
    );
  }
}
