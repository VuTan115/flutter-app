import 'package:goob_by_me/device/storage/shared_preference.dart';
import 'package:goob_by_me/domain/models/principal.model.dart';
import 'package:goob_by_me/domain/repositories/exceptions/authentication_exception.dart';
import 'package:logging/logging.dart';

class AuthenticationRepository {
  // Members
  final Logger _logger = Logger('AuthenticationRepository');
  final SharedPreference _sharedPreference = SharedPreference();

  // Singleton object of `AuthenticationRepository`
  static AuthenticationRepository _instance = AuthenticationRepository._internal();

  // Constructors
  AuthenticationRepository._internal();

  factory AuthenticationRepository() => _instance;

  // Methods
  Future<Principal> setPrincipal(Principal principal) async {
    try {
      return await _sharedPreference.setPrincipal(principal) ? principal : Principal.def();
    } on Exception {
      throw SetPrincipalFailure();
    }
  }

  Future<Principal> getPrincipal() async {
    try {
      return await _sharedPreference.getPrincipal();
    } on Exception {
      throw GetPrincipalFailure();
    }
  }

  Future<void> signUp(String phone, {required String password}) async {
    try {
      // await _api.signUp(phone, password: password);
    } on Exception {
      throw SignUpFailure();
    }
  }

  Future<void> logIn(String phone, {required String password, required String otp}) async {
    try {
      String token;
      if (password != null) {
        // token = await _api.signIn(phone, password: password);
      } else {
        // Check otp
        if (otp == otp) {
          // token = await _api.signIn(phone, otp: otp);
        }
      }
    } on Exception {
      throw LogInFailure();
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        // await _api.signOut();
        _sharedPreference.setPrincipal(Principal.def()),
      ]);
    } on Exception {
      throw LogOutFailure();
    }
  }
}
