import 'package:flutter/material.dart';

import '../constants.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(apptitle),
      ),
      body: Center(
        child: Text('Error Page'),
      ),
    );
  }
}
