import 'package:flutter/material.dart';

import './New_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState  createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),

      ],
    );
  }
}