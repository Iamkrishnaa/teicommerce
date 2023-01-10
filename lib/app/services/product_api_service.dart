import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:teicommerce/app/consts/app_apis.dart';

class ProductApiService {
  var client = http.Client();

  Future getAllProducts(
    int pageNumber,
    int pageSize,
    String sortBy,
  ) async {
    try {
      Uri url = Uri.parse(
        "${AppApis.productApis.getAllProducts}?pageSize=$pageSize&sortBy=$sortBy&pageNumber=$pageNumber",
      );
      var response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      return response;
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  Future getProductsByCategory(
    int pageNumber,
    int pageSize,
    String sortBy,
    String categorySlug,
  ) async {
    try {
      Uri url = Uri.parse(
        "${AppApis.productApis.getProductsByCategory}$categorySlug?pageSize=$pageSize&sortBy=$sortBy&pageNumber=$pageNumber",
      );
      var response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      return response;
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  Future getAllCategories(
    int pageNumber,
    int pageSize,
    String sortBy,
  ) async {
    try {
      Uri url = Uri.parse(
        "${AppApis.categoryApis.getAllCategories}?pageSize=$pageSize&sortBy=$sortBy&pageNumber=$pageNumber",
      );
      var response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      return response;
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }
}
