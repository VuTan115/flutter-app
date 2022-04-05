import 'dart:math';

import 'package:uuid/uuid.dart';

class Generation {
  final Random _random = Random();

  // Generate a random key.
  String key() {
    return '${_bitsDigits(12, 3)}${_bitsDigits(16, 4)}';
  }

  // Generate a version 4 (random) uuid.
  String uuid() {
    return Uuid().v4();

    // OLD!
    // This is a uuid scheme that only uses random numbers as the source of the generated uuid.
    // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
    //final special = 8 + _random.nextInt(4);

    // return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
    //     '${_bitsDigits(16, 4)}-'
    //     '4${_bitsDigits(12, 3)}-'
    //     '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
    //     '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
  }

  String _bitsDigits(int bitCount, int digitCount) => _printDigits(_generateBits(bitCount), digitCount);

  String _printDigits(int value, int count) => value.toRadixString(16).padLeft(count, '0');

  int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);
}
