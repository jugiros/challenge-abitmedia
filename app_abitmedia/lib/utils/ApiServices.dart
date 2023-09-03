import 'dart:convert';
import 'package:app_abitmedia/models/LoginData.dart';
import 'package:app_abitmedia/utils/Endpoints.dart';
import 'package:app_abitmedia/utils/urlApi.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = UrlApi.API; // La URL base de la API

  // Método login para obtener el token de autenticación para consumo de servicios
  Future<dynamic> login(LoginData loginData) async {
    var data = json.encode({
      'grant_type': 'password',
      'username': loginData.emailController.text,
      'password': loginData.passwordController.text
    });
    final response = await http.post(
      Uri.parse('$baseUrl/${Endpoints.login}'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': 'Basic dGVzdGp3dGNsaWVudGlkOlhZN2ttem9OemwxMDA='
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Error en la solicitud POST: ${response.reasonPhrase}');
    }
  }

  // Método para realizar una solicitud HTTP GET
  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error en la solicitud GET: ${response.reasonPhrase}');
    }
  }

  // Método para realizar una solicitud HTTP POST
  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Error en la solicitud POST: ${response.reasonPhrase}');
    }
  }

  // Método para realizar una solicitud HTTP PUT
  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
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
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode != 204) {
      throw Exception('Error en la solicitud DELETE: ${response.reasonPhrase}');
    }
  }
}
