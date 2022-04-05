// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(name) => "Hello ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);

  static _notInlinedMessages(_) => <String, Function>{
        "applicationClosingConfirmation": MessageLookupByLibrary.simpleMessage("Do you want to close the application?"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "hello": m0,
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "homePage": MessageLookupByLibrary.simpleMessage("Home page"),
        "mainPage1": MessageLookupByLibrary.simpleMessage("Home"),
        "mainPage1SearchHintText": MessageLookupByLibrary.simpleMessage("Search on Gobid..."),
        "mainPage2": MessageLookupByLibrary.simpleMessage("Transport"),
        "mainPage2SearchHintText": MessageLookupByLibrary.simpleMessage("Search destination..."),
        "mainPage3": MessageLookupByLibrary.simpleMessage("Trading"),
        "mainPage3SearchHintText": MessageLookupByLibrary.simpleMessage("Search product..."),
        "mainPage4": MessageLookupByLibrary.simpleMessage("Place"),
        "mainPage4SearchHintText": MessageLookupByLibrary.simpleMessage("Search place..."),
        "mainPage5": MessageLookupByLibrary.simpleMessage("Payment"),
        "mainPage5SearchHintText": MessageLookupByLibrary.simpleMessage("Search transaction..."),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "searchHintText": MessageLookupByLibrary.simpleMessage("Search..."),
        "submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
