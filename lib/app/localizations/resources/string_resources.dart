import 'package:intl/intl.dart';

mixin StringResources {
  String hello(name) {
    return Intl.message('Hello {name}', name: 'hello', args: [name]);
  }

  String get home {
    return Intl.message('Home', name: 'home');
  }

  String get yes {
    return Intl.message('Yes', name: 'yes');
  }

  String get no {
    return Intl.message('No', name: 'no');
  }

  String get confirm {
    return Intl.message('Confirm', name: 'confirm');
  }

  String get submit {
    return Intl.message('Submit', name: 'submit');
  }

  String get cancel {
    return Intl.message('Cancel', name: 'cancel');
  }

  String get close {
    return Intl.message('Close', name: 'close');
  }

  String get applicationClosingConfirmation {
    return Intl.message('Do you want to close the application?', name: 'applicationClosingConfirmation');
  }

  String get homePage {
    return Intl.message('Home page', name: 'homePage');
  }

  String get mainPage1 {
    return Intl.message('Home', name: 'mainPage1');
  }

  String get mainPage2 {
    return Intl.message('Transport', name: 'mainPage2');
  }

  String get mainPage3 {
    return Intl.message('Trading', name: 'mainPage3');
  }

  String get mainPage4 {
    return Intl.message('Place', name: 'mainPage4');
  }

  String get mainPage5 {
    return Intl.message('Payment', name: 'mainPage5');
  }

  String get searchHintText {
    return Intl.message('Search...', name: 'searchHintText');
  }

  String get mainPage1SearchHintText {
    return Intl.message('Search on Gobid...', name: 'mainPage1SearchHintText');
  }

  String get mainPage2SearchHintText {
    return Intl.message('Search destination...', name: 'mainPage2SearchHintText');
  }

  String get mainPage3SearchHintText {
    return Intl.message('Search product...', name: 'mainPage3SearchHintText');
  }

  String get mainPage4SearchHintText {
    return Intl.message('Search place...', name: 'mainPage4SearchHintText');
  }

  String get mainPage5SearchHintText {
    return Intl.message('Search transaction...', name: 'mainPage5SearchHintText');
  }
}
