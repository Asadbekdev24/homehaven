import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_imtihon/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RepositoriesEd {
  Future<ProductModel> getProduct(String token) async {
    final datapath = "https://e-commerce.birnima.uz/api/products";
    final url = Uri.parse(datapath);

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        log(response.body);
        final data = jsonDecode(response.body);

        return ProductModel.fromJson(data);
      }

      throw Exception("xatolik sodir bo'ldi");
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> logIn(String phoneNumber, String password) async {
    final logInUrl = "https://e-commerce.birnima.uz/api/auth/signin";
    final url = Uri.parse(logInUrl);

    final sendData = {
      "auth_method": "phone-number",
      "password": password,
      "phone_number": phoneNumber,
      "email": ""
    };

    try {
      final getToken = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(sendData),
      );

      if (getToken.statusCode == 201) {
        final tokenPrefens = await SharedPreferences.getInstance();
        tokenPrefens.setString(
            "token", jsonDecode(getToken.body)["data"]["access_token"]);

        return "yaxshi";
      }

      return "yomon";
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String?> signUp(String phoneNumber, String password, String firstName, String lastName) async {
    final sigupUrl = "https://e-commerce.birnima.uz/api/auth/signup";
    final url = Uri.parse(sigupUrl);

    final signUpData={
      "auth_method": "phone-number",
      "password": password,
      "phone_number": phoneNumber,
      "email": ""
    };

    try {
      final addUser = await http.post(url, body: jsonEncode(signUpData),
      headers: {"Content-Type": "application/json"},
      );

      if(addUser.statusCode==201)
      {
        final tokenPrefensSigup= await SharedPreferences.getInstance();
        tokenPrefensSigup.setString("token2", jsonDecode(addUser.body)["data"]["access_token"]);

        final mapGet=jsonDecode(addUser.body)["data"]["access_token"];

        return mapGet;
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
