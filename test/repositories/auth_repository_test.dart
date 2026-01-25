import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:learning/repositories/auth_repository.dart';
import 'package:learning/data/network/base_api_service.dart';
import 'package:learning/res/app_urls.dart';

class MockBaseApiService extends Mock implements BaseApiService {}

void main() {
  late MockBaseApiService mockApiService;
  late AuthRepository authRepository;

  setUp(() {
    mockApiService = MockBaseApiService();
    authRepository = AuthRepository(apiService: mockApiService);
  });

  test("registerApi should return response when API call success", () async {
    final data = {"name": "Test"};
    final mockResponse = {"success": true};

    when(() => mockApiService.getPostApiResponse(AppUrls.register, data))
        .thenAnswer((_) async => mockResponse);

    final result = await authRepository.registerApi(data);

    expect(result, mockResponse);

    verify(() => mockApiService.getPostApiResponse(AppUrls.register, data))
        .called(1);
  });

  test("registerApi should throw exception when API call fails", () async {
    final data = {"name": "Test"};

    when(() => mockApiService.getPostApiResponse(AppUrls.register, data))
        .thenThrow(Exception("Network Error"));

    expect(
          () async => await authRepository.registerApi(data),
      throwsA(isA<Exception>()),
    );

    verify(() => mockApiService.getPostApiResponse(AppUrls.register, data))
        .called(1);
  });
}
