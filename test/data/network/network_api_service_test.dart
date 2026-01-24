import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:learning/data/app_exceptions.dart';
import 'package:learning/data/network/base_api_service.dart';
import 'package:learning/data/network/network_api_service.dart';
import 'package:mocktail/mocktail.dart';



class MockHttpClient extends Mock implements http.Client {}

void main(){
  late MockHttpClient mockHttpClient;
  late BaseApiService apiService;

  const url = 'https://example.com/api';

  setUp((){
    mockHttpClient = MockHttpClient();
    apiService = NetworkApiService(client: mockHttpClient);
  });

  group('GET API test', (){
    test('GET returns response body when status code is 200',() async{
      when(() => mockHttpClient.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response('{"success":true}', 200));

      final result = await apiService.getGetApiResponse(url);

      expect(result, '{"success":true}');
      verify(() => mockHttpClient.get(Uri.parse(url))).called(1);
    });

    test('GET throws BadRequestException when status code is 400', () async{
      when(() => mockHttpClient.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response('Bad Request', 400));
      
      expect(()=> apiService.getGetApiResponse(url), throwsA(isA<BadRequestException>()));
    });

    test('GET throws UnauthorizedException when status code is 401', () async {
      when(() => mockHttpClient.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response('Unauthorized', 401));

      expect(() => apiService.getGetApiResponse(url), throwsA(isA<UnauthorizedException>()));
    });

    test('GET throws UnauthorizedException when status code is 404', () async {
      when(() => mockHttpClient.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => apiService.getGetApiResponse(url), throwsA(isA<UnauthorizedException>()));
    });

    test('GET throws FetchDataException when status code is 500', () async {
      when(() => mockHttpClient.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response('Server Error', 500));

      expect(() => apiService.getGetApiResponse(url), throwsA(isA<FetchDataException>()));
    });

    test('GET throws FetchDataException on SocketException', () async {
      when(() => mockHttpClient.get(Uri.parse(url)))
          .thenThrow(SocketException('No Internet'));

      expect(() => apiService.getGetApiResponse(url), throwsA(isA<FetchDataException>()));
    });

  });

  group('POST API test', (){
    test('POST returns response body when status code is 200',() async{
      when(() => mockHttpClient.post(Uri.parse(url), body: {'key':'value'}))
          .thenAnswer((_) async => http.Response('{"success":true}', 200));

      final result = await apiService.getPostApiResponse(url, {'key':'value'});

      expect(result, '{"success":true}');
      verify(() => mockHttpClient.post(Uri.parse(url), body: {'key':'value'})).called(1);
    });

    test('POST throws BadRequestException when status code is 400', () async{
      when(() => mockHttpClient.post(Uri.parse(url), body: {'key':'value'}))
          .thenAnswer((_) async => http.Response('Bad Request', 400));

      expect(()=> apiService.getPostApiResponse(url, {'key':'value'}), throwsA(isA<BadRequestException>()));
    });

    test('POST throws UnauthorizedException when status code is 401', () async {
      when(() => mockHttpClient.post(Uri.parse(url), body: {'key':'value'}))
          .thenAnswer((_) async => http.Response('Unauthorized', 401));

      expect(() => apiService.getPostApiResponse(url, {'key':'value'}), throwsA(isA<UnauthorizedException>()));
    });

    test('POST throws UnauthorizedException when status code is 404', () async {
      when(() => mockHttpClient.post(Uri.parse(url), body: {'key':'value'}))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => apiService.getPostApiResponse(url, {'key':'value'}), throwsA(isA<UnauthorizedException>()));
    });

    test('POST throws InvalidInputException when status code is 422', () async {
      when(() => mockHttpClient.post(Uri.parse(url), body: {'key':'value'}))
          .thenAnswer((_) async => http.Response('Unprocessable Entity', 422));

      expect(() => apiService.getPostApiResponse(url, {'key':'value'}), throwsA(isA<InvalidInputException>()));
    });

    test('POST throws FetchDataException when status code is 500', () async {
      when(() => mockHttpClient.post(Uri.parse(url), body: {'key':'value'}))
          .thenAnswer((_) async => http.Response('Server Error', 500));

      expect(() => apiService.getPostApiResponse(url, {'key':'value'}), throwsA(isA<FetchDataException>()));
    });

    test('POST throws FetchDataException on SocketException', () async {
      when(() => mockHttpClient.post(Uri.parse(url), body: {'key':'value'}))
          .thenThrow(SocketException('No Internet'));

      expect(() => apiService.getPostApiResponse(url, {'key':'value'}), throwsA(isA<FetchDataException>()));
    });

  });
}