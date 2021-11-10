import 'package:flutter/material.dart';
import 'package:monobank_app/states.dart';
import 'HomePage/home_page.dart';
import 'Elements/navigation_bar.dart';
import 'package:redux/redux.dart';
import 'reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  final Store<CashState> store =
      Store<CashState>(cashReducer, initialState: CashState.startValues);
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<CashState> store;

  const MyApp(this.store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CashState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(context),
      body: HomePage(),
    );
  }
}