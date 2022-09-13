import 'package:firstapp/services/auth/auth_exceptions.dart';
import 'package:firstapp/services/auth/auth_provider.dart';
import 'package:firstapp/services/auth/auth_user.dart';
import 'package:test/test.dart';

void main() {
  group('Mock Authenticatoin', () {
    final provider = MockAuthProvider();
    test(
      'SHould not be initialized to begin with',
      () {
        expect(provider.isInitialize, false);
      },
    );
    test('cannot log out if not initialized', () {
      expect(
        provider.logOut(),
        throwsA(const TypeMatcher<NotInitializeException>()),
      );
    });

    test('should be able to be initialized', () async {
      await provider.initialize();
      expect(provider.isInitialize, true);
    });
    test('User should be null after initialize', () {
      expect(provider.currentUser, null);
    });
    test(
      'should be able initialize in less 2 sec',
      () async {
        await provider.initialize();
        expect(provider.isInitialize, true);
      },
      timeout: const Timeout(Duration(seconds: 2)),
    );

    test('Create user should delegate to login  func', () async {
      final badEmailUser = provider.createUser(
        email: 'qwe@asd.zxc',
        password: "anyshit",
      );
      expect(badEmailUser,
          throwsA(const TypeMatcher<UserNotFoundAuthException>()));

      final badPasswordUser = provider.createUser(
        email: 'zxc@asd.qwe',
        password: "qazxsweccc",
      );
      expect(badPasswordUser,
          throwsA(const TypeMatcher<WrongPasswordAuthException>()));

      final user = provider.createUser(
        email: 'qwe',
        password: "asdzxc",
      );
      expect(provider.currentUser, user);
    });
    test('Logged in user should be able to  get  verified', () {
      provider.sendEmailVerification();
      final user = provider.currentUser;
      expect(user, isNotNull);
      expect(user!.isEmailVerified, true);
    });
    test('should    be able  to log out and log in again', () async {
      await provider.logOut();
      await provider.logIn(
        email: 'email',
        password: 'password',
      );
      final user = provider.currentUser;
      expect(user, isNotNull);
    });
  });
}

class NotInitializeException implements Exception {}

class MockAuthProvider implements AuthProvider {
  AuthUser? _user;
  var _isInitialize = false;
  bool get isInitialize => _isInitialize;
  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    if (!isInitialize) throw NotInitializeException();
    await Future.delayed(const Duration(seconds: 1));
    return logIn(
      email: email,
      password: password,
    );
  }

  @override
  AuthUser? get currentUser => _user;

  @override
  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 3));
    _isInitialize = true;
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) {
    if (!isInitialize) throw NotInitializeException();
    if (email == 'qwe@asd.zxc') throw UserNotFoundAuthException();
    if (password == '123456423') throw WrongPasswordAuthException();
    const user = AuthUser(
      isEmailVerified: false,
      email: 'foo@bar.bez',
    );
    _user = user;
    return Future.value(user);
  }

  @override
  Future<void> logOut() async {
    if (!isInitialize) throw NotInitializeException();
    if (_user == null) throw UserNotFoundAuthException();
    await Future.delayed(const Duration(seconds: 1));
    _user = null;
  }

  @override
  Future<void> sendEmailVerification() async {
    if (!isInitialize) throw NotInitializeException();
    final user = _user;
    if (user == null) throw UserNotFoundAuthException();
    const newUser = AuthUser(
      isEmailVerified: true,
      email: 'foo@bar.bez',
    );
    _user = newUser;
  }
}
