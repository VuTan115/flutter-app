import 'package:flutter/material.dart';
import 'package:goob_by_me/app/components/indication/progress_indicator.dart' as pi;
import 'package:goob_by_me/app/routes/route_settings_interface.dart';
import 'package:goob_by_me/core/utils/extensions.dart';

// Forwarder, wait 1000 milliseconds by default. Fix error: Duplicate GlobalKey when using the Navigator
// Arguments: {'destination': '/home', 'duration': Duration(milliseconds: 1000), arguments: Map<String, Object>}
class Forwarder extends StatefulWidget {
  final Map<String, Object>? arguments;

  Forwarder({Key? key, this.arguments}) : super(key: key);

  @override
  _ForwarderState createState() => _ForwarderState();
}

class _ForwarderState extends State<Forwarder> with RouteSettingConfig {
  late String _route;
  late Duration _duration;
  late Map<String, Object> _arguments;
  @override
  Map<String, Object> routeSettingToMap(RouteSettings settings) {
    // TODO: implement routeSettingToMap
    throw UnimplementedError();
  }

  @override
  void initState() {
    super.initState();

    _route = '/home'; // Default route
    _duration = Duration(milliseconds: 1000); // Default duration
    _route = widget.arguments!['destination'].toString();
    _duration = Duration(microseconds: int.parse(widget.arguments!['duration'].toString()));
    // _arguments = widget.arguments!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _forward(context),
        builder: (context, snapshot) {
          return Center(child: pi.ProgressIndicator());
        },
      ),
    );
  }

  Future<String> _forward(context) async {
    await Future.delayed(_duration).then((value) {
      Navigator.pushNamedAndRemoveUntil(context, _route, (Route<dynamic> route) => false,
          arguments: _arguments);
    });

    return '_forward';
  }
}
