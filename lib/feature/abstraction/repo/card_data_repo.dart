import 'dart:developer';

import 'package:cred_demo_application/feature/abstraction/model/card_data_model.dart';
import 'package:dio/dio.dart';


class DioClient {
  static final DioClient _instance = DioClient._internal();

  late final Dio _dio;

  // Private constructor
  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        // baseUrl: 'https://api.mocklets.com/p6764/test_mint',
        connectTimeout: const Duration(seconds: 15), // Connection timeout
        receiveTimeout: const Duration(seconds: 20), // Response timeout
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log('Request: ${options.uri}');
          log('Extra: ${options.extra}');
          log('QueryParameters: ${options.queryParameters}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // the response
          log('Response: ${response.statusCode} - ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) {
          // Handle errors globally
          log('Error: ${error.message}');
          return handler.next(error);
        },
      ),
    );
  }

  // Factory constructor for getting the singleton instance
  factory DioClient() {
    return _instance;
  }

  // Getter to access the Dio instance
  Dio get dio => _dio;
}

class CardDataRepo {
  static final _dio = DioClient().dio;

  static Future<MockApiModel?> getCardData() async {
    try {
      final response =
          await _dio.get('https://api.mocklets.com/p6764/test_mint');
      final data = MockApiModel.fromJson(response.data);
      return data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        log('Connection timeout. Please try again later.');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        log('Server took too long to respond. Please try again later.');
      } else {
        log('Something went wrong: ${e.message}');
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }
}
