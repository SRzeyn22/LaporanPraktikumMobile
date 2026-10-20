import 'dart:convert';

import '../model/country.dart';
import 'package:http/http.dart' as http;

const String _baseUrl = 'https://countries.dev';

Future<List<Country>> fetchCountries() async {
  final uri = Uri.parse('$_baseUrl/countries').replace(queryParameters: {
    'sort': 'name',
    'fields':
        'name,alpha2Code,alpha3Code,flag,flags,capital,region,subregion,population,area,nativeName,languages,currencies,timezones,borders,callingCodes',
  });

  final response = await http.get(uri).timeout(const Duration(seconds: 20));

  if (response.statusCode != 200) {
    throw Exception('Gagal mengambil daftar negara (HTTP ${response.statusCode}).');
  }

  final decoded = jsonDecode(response.body);
  if (decoded is! List) {
    throw Exception('Format data daftar negara tidak sesuai.');
  }

  return decoded
      .whereType<Map<String, dynamic>>()
      .map(Country.fromJson)
      .toList();
}

Future<Country> fetchCountryByCode(String code) async {
  final safeCode = Uri.encodeComponent(code);
  final response = await http
      .get(Uri.parse('$_baseUrl/alpha/$safeCode'))
      .timeout(const Duration(seconds: 20));

  if (response.statusCode != 200) {
    throw Exception('Gagal mengambil detail negara (HTTP ${response.statusCode}).');
  }

  final decoded = jsonDecode(response.body);
  if (decoded is! Map<String, dynamic>) {
    throw Exception('Format data detail negara tidak sesuai.');
  }

  return Country.fromJson(decoded);
}
