import 'package:flutter/material.dart';
import 'package:hack/model/user.dart';
import 'package:hack/screens/authenticate.dart';
import 'package:hack/screens/selection_screen.dart';
import 'package:hack/services/database.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<GetUser?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      DataBase(uid: user.uid).formdatabaseservice('');
      return Selection_Screen();
    }
  }
}