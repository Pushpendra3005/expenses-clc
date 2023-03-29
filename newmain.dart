import 'dart:js_util';

import 'package:flutter/material.dart';

import './widgets/New_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './Chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            subtitle2: TextStyle(
                fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            )),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(
                fontFamily: 'OpenSans',
            fontSize: 20,
                fontWeight: FontWeight.bold,
            ),
          ),
        )
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  final List<Transaction> _userTransactions = [
   // Transaction(
     // id: 't1',
      // title: 'New Shoes',
    //  amount: 69.99,
       // date: DateTime.now(),
    // ),
    // Transaction(
    //  id: 't2',
    //  title: 'Weekly Groceries',
    //  amount: 16.53,
    //  date: DateTime.now(),
   // ),
  ];

  List<Transaction> get _recentTransactions {
  return _userTransactions.where((tx) {
    return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),),
    );
  }).toList();
  }
}

  void _addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setProperty(() {

      _userTransaction.add(newTx);
    },
    );

  void _startAddNewTransacton(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransacton(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icon.add),
        onPressed: () => _startAddNewTransacton(context),
      ),
    );
  }}
