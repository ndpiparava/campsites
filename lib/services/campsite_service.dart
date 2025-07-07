import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/campsite.dart';

class CampsiteService {
  final http.Client client;

  CampsiteService({http.Client? client}) : client = client ?? http.Client();

  Future<List<Campsite>> fetchCampsites() async {
    final response = await client.get(
      Uri.parse(
        'https://62ed0389a785760e67622eb2.mockapi.io/spots/v1/campsites',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((e) => Campsite.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load campsites');
    }
  }
}
