import 'package:logging/logging.dart';

class HomePageRepository {
  // Members
  final Logger _logger = Logger('HomePageRepository');

  // Singleton object of `HomePageRepository`
  static HomePageRepository _instance = HomePageRepository._internal();

  // Constructors
  HomePageRepository._internal();

  factory HomePageRepository() => _instance;

// Methods
}
