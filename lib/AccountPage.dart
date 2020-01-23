import 'package:company_task/Material.dart';
import 'package:flutter/material.dart';
import 'Material.dart';


class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("Account")),

      ),
      body: Center(child: Text("Account Page",style: getData().textStyle,)),
    );
  }
}
