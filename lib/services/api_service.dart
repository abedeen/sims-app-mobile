import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future<List<dynamic>> getData(String url) async {
    final client = http.Client();
    try {
      final prefs = await SharedPreferences.getInstance();
      final session = prefs.getString('JSESSIONID');
      //final response = await client.get(Uri.parse(url));
      final response = await client.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          if (session != null) 'Cookie': session,
        },
      );
      if (response.statusCode == 200) {
        //return jsonDecode(response.body);
        final decoded = jsonDecode(response.body);

        // ✅ return the array, not the whole object
        return decoded['results'] as List<dynamic>;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    } finally {
      client.close();
    }
  }
}
