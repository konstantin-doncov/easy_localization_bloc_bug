import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Container(
        child: Text(tr('test')),
      ),
    );
  }
}
