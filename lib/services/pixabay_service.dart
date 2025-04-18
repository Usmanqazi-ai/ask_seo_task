import 'dart:convert';
import 'package:http/http.dart' as http;

// lib/services/pixabay_service.dart


class PixabayService {
  static const String _apiKey = '49775732-b23cf270d0e641e7e5296f256';

  Future<List<String>> fetchImages(String query) async {
    final url = Uri.parse(
        'https://pixabay.com/api/?key=$_apiKey&q=$query&image_type=photo');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List hits = data['hits'];
      return hits.map((e) => e['webformatURL'] as String).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
