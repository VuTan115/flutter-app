import 'package:flutter/material.dart';
import 'package:goob_by_me/app/components/indication/waiting_indicator.dart' as wi;
import 'package:goob_by_me/app/utils/media.dart';
import 'package:goob_by_me/app/utils/utils.dart';

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with AutomaticKeepAliveClientMixin {
  // NavigatorState get _navigator => GlobalKeys.appNavigator.currentState;

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    print('Delivery - Main');

    Media media = Media(context);
    double r = media.ratio;

    super.build(context);

    return Container(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      child: ListView(
        children: [
          //Loading
          Container(
            padding: EdgeInsets.only(top: r * 20, bottom: r * 20),
            color: Color.fromRGBO(255, 255, 255, 1.0),
            child: Center(child: wi.WaitingIndicator()),
          )
        ],
      ),
    );
  }
}
