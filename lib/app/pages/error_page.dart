import 'package:flutter/material.dart';
import 'package:goob_by_me/core/utils/extensions.dart';

class ErrorPage extends StatelessWidget {
  final Map<String, Object> arguments;

  ErrorPage({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message = arguments['error'].toString();

    return Scaffold(
      body: Center(
        child: Text('Error: ' + message),
      ),
    );
  }
}
