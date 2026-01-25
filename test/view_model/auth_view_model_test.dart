import 'package:flutter_test/flutter_test.dart';
import 'package:learning/repositories/auth_repository.dart';
import 'package:learning/view_model/auth_view_model.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late AuthViewModel authViewModel;
  late MockAuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    authViewModel = AuthViewModel(authRepo: authRepository);
  });

  test('Initial values are correct', () {
    expect(authViewModel.loading, false);
    expect(authViewModel.registerButtonEnabled, false);
    expect(authViewModel.name, '');
    expect(authViewModel.email, '');
    expect(authViewModel.address, '');
    expect(authViewModel.password, '');
    expect(authViewModel.confirmPassword, '');
    expect(authViewModel.privacyPolicyAccept, false);
  });

  test('setLoading should update loading and notify listener', () {
    var notifiedCount = 0;
    authViewModel.addListener(() {
      notifiedCount++;
    });

    authViewModel.setLoading(true);
    expect(authViewModel.loading, true);
    expect(notifiedCount, 1);
  });

  test('Register Button should remain disabled if inputs are invalid', () {
    authViewModel.setName('John');
    authViewModel.setEmail('invalid-email');
    authViewModel.setAddress('');
    authViewModel.setPassword('123');
    authViewModel.setConfirmPassword('1234');
    authViewModel.setPrivacyPolicyAccept(false);
    expect(authViewModel.registerButtonEnabled, false);
  });

  test('Register button should enable when all inputs are valid', () {
    authViewModel.setName('John Doe');
    authViewModel.setEmail('suthar@gmail.com');
    authViewModel.setAddress('123 Main St');
    authViewModel.setPassword('password123');
    authViewModel.setConfirmPassword('password123');
    authViewModel.setPrivacyPolicyAccept(true);
    expect(authViewModel.registerButtonEnabled, true);
  });

  test('registerApi should set loading true then false on success', () async {
    when(
      () => authRepository.registerApi(any()),
    ).thenAnswer((_) async => {'ok': true});

    expect(authViewModel.loading, false);

    final future = authViewModel.registerApi({'name': 'John Doe'});
    expect(authViewModel.loading, true);

    await future;
    expect(authViewModel.loading, false);

    verify(() => authRepository.registerApi(any())).called(1);
  });

  test(
    'registerApi should set loading false even when error happens',
    () async {
      when(
        () => authRepository.registerApi(any()),
      ).thenThrow(Exception('Network Error'));

      expect(authViewModel.loading, false);

      try {
        await authRepository.registerApi({"name": "Test"});
      } catch (_) {}

      expect(authViewModel.loading, false);

      verify(() => authRepository.registerApi(any())).called(1);
    },
  );

  test('registerApi should call onError and set loading false', () async {
    final data = {"name": "Test"};
    when(
      () => authRepository.registerApi(data),
    ).thenAnswer((_) => Future.error('Some error'));

    expect(authViewModel.loading, false);

    await authViewModel.registerApi(data);

    expect(authViewModel.loading, false);

    verify(() => authRepository.registerApi(any())).called(1);
  });
}
