import 'package:dio/dio.dart';

import 'package:ecommerce_app/core/errors/custom_exception.dart';
class ApiService {
  ApiService._internal()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.escuelajs.co/api/v1/',
          headers: {'Content-Type': 'application/json'},
        ),
      );

  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  final Dio _dio;

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
    
      return await _dio.get(path, queryParameters: queryParams);
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        throw CustomeExecption("No internet connection.");
      } else if (e.toString().contains("500")) {
        throw CustomeExecption("Server error. Please try again later.");
      } else {
        throw CustomeExecption("Unexpected error. Try again.");
      }
    }
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post(path, data: data);
    }  catch (e) {
      if (e.toString().contains("SocketException")) {
        throw CustomeExecption("No internet connection.");
      } else if (e.toString().contains("500")) {
        throw CustomeExecption("Server error. Please try again later.");
      } else {
        throw CustomeExecption("Unexpected error. Try again.");
      }
    }
  }

  Future<Response> put(String path, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.put(path, data: data);
    }  catch (e) {
      if (e.toString().contains("SocketException")) {
        throw CustomeExecption("No internet connection.");
      } else if (e.toString().contains("500")) {
        throw CustomeExecption("Server error. Please try again later.");
      } else {
        throw CustomeExecption("Unexpected error. Try again.");
      }
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await _dio.delete(path);
    }  catch (e) {
      if (e.toString().contains("SocketException")) {
        throw CustomeExecption("No internet connection.");
      } else if (e.toString().contains("500")) {
        throw CustomeExecption("Server error. Please try again later.");
      } else {
        throw CustomeExecption("Unexpected error. Try again.");
      }
    }
  }
}
