
import 'package:flutter_test/flutter_test.dart';
import 'package:mavazi/Services/auth_api.dart';
import 'package:mavazi/model/user.dart';
import 'package:mavazi/model/login_result.dart';
import 'package:mavazi/viewmodel/auth_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthApi extends Mock implements AuthApi{}

User _mockUser = User(
  id: 1,
  username: 'ines',
  email: 'uwase@xmali.com',
  firstName: 'Queen',
  lastName: 'Uwase',
  gender: 'female',
  image: 'https://imahe.url',
);

void main(){
  late MockAuthApi mockApi;

  setUpAll(() {
    registerFallbackValue(_mockUser);
  });

  setUp((){
    SharedPreferences.setMockInitialValues({});
    mockApi = MockAuthApi();
  });

  group('login', (){
    test('successful login', () async {
      when(
        ()=> mockApi.login(any(), any())
      ).thenAnswer(
        (_) async => LoginResult(
          user: _mockUser,
          accessToken: 'access123',
          refreshToken: 'refresh123',
        ),
      );
      final vm = AuthViewModel(authApi: mockApi);

      var success = await vm.login('queen', 'queenpassw');

      expect(vm.authStatus, AuthStatus.authenticated);
      expect(success, isTrue);
    });
  });
}