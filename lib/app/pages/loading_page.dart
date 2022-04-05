import 'package:flutter/material.dart';
import 'package:goob_by_me/app/components/indication/progress_indicator.dart'
    as pi;

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pi.ProgressIndicator()),
    );
  }
}
