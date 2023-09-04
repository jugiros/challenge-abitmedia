import 'dart:convert';
import 'package:app_abitmedia/entities/PaymentLinkEntity.dart';
import 'package:app_abitmedia/entities/PaymentRequestEntity.dart';
import 'package:app_abitmedia/entities/User.dart';
import 'package:app_abitmedia/models/LoginData.dart';
import 'package:app_abitmedia/ui/home.dart';
import 'package:app_abitmedia/ui/login.dart';
import 'package:app_abitmedia/utils/Endpoints.dart';
import 'package:app_abitmedia/utils/ServiceInfoModal.dart';
import 'package:app_abitmedia/utils/jwtCredentials.dart';
import 'package:app_abitmedia/utils/urlApi.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final Box _boxLogin = Hive.box("login");

  static const snackBarError = SnackBar(
    content: Text('Error edentro del proceso.'),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 5),
  );

  static const snackBarSucces = SnackBar(
    content: Text('Proceso realizado correctamente.'),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 5),
  );

  // Método login para obtener el token de autenticación para consumo de servicios
  static Future<dynamic> login(LoginData loginData, context) async {
    final data = {
      'grant_type': 'password',
      'username': loginData.emailController.text,
      'password': loginData.passwordController.text
    };
    String basicAut = base64.encode(
        utf8.encode('${JwtCredentials.clientId}:${JwtCredentials.secretKey}'));
    final response = await http.post(
      Uri.parse('${UrlApi.API}/${Endpoints.login}'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic $basicAut'
      },
      body: data,
    );

    if (response.statusCode == 200) {
      String bodyResponse = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(bodyResponse);
      _boxLogin.put("token", jsonData["access_token"]);
      _boxLogin.put("status", true);
      _boxLogin.put("username", loginData.emailController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MyHomePage();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBarSucces);
      return jsonData;
    } else {
      const snackBarLogin = SnackBar(
        content: Text('Credenciales incorrectas.'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBarLogin);
      return json.decode(response.body);
    }
  }

  //Método para registrar un nuevo usuario
  static Future<dynamic> register(User user, context) async {
    Map<String, dynamic> userMap = user.toJson();
    final response = await post(Endpoints.register, userMap, context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const Login();
        },
      ),
    );
    return response;
  }

  //Método para generar una solicitud de pago
  static Future<dynamic> paymentRequest(
      PaymentRequestEntity paymentRequest, context) async {
    Map<String, dynamic> paymentRequestMap = paymentRequest.toJson();
    final response =
        await post(Endpoints.paymentRequest, paymentRequestMap, context);
    String info = response['data']['url'];
    ServiceInfoModal.show(context, info);
    return response;
  }

  //Método para generar una solicitud de pago
  static Future<dynamic> paymentLink(
      PaymentLinkEntity paymentLink, context) async {
    Map<String, dynamic> paymentLinkMap = paymentLink.toJson();
    final response =
    await post(Endpoints.paymentLink, paymentLinkMap, context);
    String info = response['data']['url'];
    ServiceInfoModal.show(context, info);
    return response;
  }

  // Método para realizar una solicitud HTTP GET
  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('${UrlApi.API}/$endpoint'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error en la solicitud GET: ${response.reasonPhrase}');
    }
  }

  // Método para realizar una solicitud HTTP POST
  static Future<dynamic> post(
      String endpoint, Map<String, dynamic> data, context) async {
    String token = _boxLogin.get("status") != null
        ? _boxLogin.get("status")
            ? _boxLogin.get('token')
            : ''
        : '';
    String bodySend = jsonEncode(data);
    final response = await http.post(
      Uri.parse('${UrlApi.API}/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token != '' ? 'Bearer $token' : ''
      },
      body: bodySend
    );

    if (response.statusCode == 200) {
      String bodyResponse = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(bodyResponse);
      ScaffoldMessenger.of(context).showSnackBar(snackBarSucces);
      return jsonData;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBarError);
      return json.decode(response.body);
    }
  }

  // Método para realizar una solicitud HTTP PUT
  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('${UrlApi.API}/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error en la solicitud PUT: ${response.reasonPhrase}');
    }
  }

  // Método para realizar una solicitud HTTP DELETE
  Future<void> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('${UrlApi.API}/$endpoint'));

    if (response.statusCode != 204) {
      throw Exception('Error en la solicitud DELETE: ${response.reasonPhrase}');
    }
  }
}
