import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

final dio = Dio(BaseOptions(
  connectTimeout: const Duration(seconds: 10),
  sendTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
));

Future<void> sendAuthInfo({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  const url = 'http://10.0.2.2:8080/login';
  final data = {
    'email': email,
    'password': hashPassword(password),
  };

  try {
    final response = await dio.post(url, data: data);

    if (response.statusCode == 200 && context.mounted) {
      Navigator.of(context).pushNamed('/');
    } else if (context.mounted) {
      final error = response.data['error'] ?? 'Unknown error';
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $error')));
    }
  } on DioException catch (e) {
    String errorMessage;
    if (context.mounted) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          errorMessage = 'Connection timeout';
          break;
        case DioExceptionType.sendTimeout:
          errorMessage = 'Send timeout';
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Receive timeout';
          break;
        case DioExceptionType.badResponse:
          errorMessage = 'Received invalid status code: ${e.response?.statusCode}';
          break;        
        case DioExceptionType.cancel:
          errorMessage = 'Request to API server was cancelled';
          break;
        case DioExceptionType.connectionError:
          errorMessage = 'Failed to connect to the server';
          break;
        default:
          errorMessage = 'Unexpected error occurred';
          break;
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $errorMessage')));
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }
}

String hashPassword(String password) {
  final bytes = utf8.encode(password);
  final digest = sha256.convert(bytes);
  return digest.toString();

}
