import 'package:flutter/material.dart';
import 'package:goob_by_me/app/pages/register_page.dart';
import 'package:goob_by_me/app/routes/app_router.dart';
import 'package:goob_by_me/app/utils/variables.dart';
import 'package:goob_by_me/domain/models/principal.model.dart';
import 'package:logging/logging.dart';

class WelcomePage extends StatelessWidget {
  final Map<String, Object>? arguments;
  final Logger _logger = Logger('WelcomePage');

  NavigatorState get _navigator => GlobalKeys.appNavigator.currentState!;

  WelcomePage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Welcome!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 32, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              width: 250,
              child: FlatButton(
                child: Text('Sign In', style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: () {
                  _logger.info('SignIn');
                  //_navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
                  _navigator.pushNamedAndRemoveUntil(
                      AppRoute.homePage, (Route<dynamic> route) => false,
                      arguments: {'principal': Principal.def()});
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0, bottom: 16),
              decoration: BoxDecoration(
                // color: Colors.green,
                border: Border.all(color: Colors.green),
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              width: 250,
              child: FlatButton(
                child: Text('Sign Up', style: TextStyle(fontSize: 18, color: Colors.green)),
                onPressed: () {
                  _logger.info('SignUp');
                  _navigator.pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => RegisterPage()), (route) => false);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Language : ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                SizedBox(
                  width: 8,
                ),
                FlatButton(
                  onPressed: () {},
                  child:
                      Text('English', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
