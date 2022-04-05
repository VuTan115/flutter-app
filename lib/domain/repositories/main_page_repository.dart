import 'package:logging/logging.dart';

class MainPageRepository {
  // Members
  final Logger _logger = Logger('MainPageRepository');

  // Singleton object of `MainPageRepository`
  static MainPageRepository _instance = MainPageRepository._internal();

  // Constructors
  MainPageRepository._internal();

  factory MainPageRepository() => _instance;

// Methods
}
