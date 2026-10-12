import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:modulAll/modul14/model/post_model.dart';

class ApiService {
  final String baseUrl = "http://10.98.80.121/api_flutter/public/api";

  // =========================
  // CREATE
  // =========================
  Future<Post?> createPost(String title, String body) async {
    final url = Uri.parse('$baseUrl/posts');
    var randomId = Random().nextInt(999999);

    print("🔵 [CREATE] URL: $url");
    print(
      "📩 [CREATE] Sending Data: title=$title, body=$body, userId=$randomId",
    );

    final response = await http.post(
      url,
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'title': title, 'body': body, 'userId': randomId}),
    );

    print("📥 [CREATE] Status Code: ${response.statusCode}");
    print("📥 [CREATE] Response Body: ${response.body}");

    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    }

    print("❌ [CREATE] Gagal membuat data!");
    return null;
  }

  // =========================
  // GET ALL
  // =========================
  Future<List<Post>> getAllPosts() async {
    final url = Uri.parse('$baseUrl/posts');

    print("🟡 [READ] URL: $url");

    final response = await http.get(url);

    print("📥 [READ] Status Code: ${response.statusCode}");
    print("📥 [READ] Response Body: ${response.body}");

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      print("🟢 [READ] Total Data: ${data.length}");
      return data.map((item) => Post.fromJson(item)).toList();
    }

    print("❌ [READ] Gagal mengambil data!");
    return [];
  }

  // =========================
  // UPDATE
  // =========================
  Future<Post?> updatePost(int id, String title, String body) async {
    final url = Uri.parse('$baseUrl/posts/$id');

    print("🟣 [UPDATE] URL: $url");
    print("📩 [UPDATE] Sending: id=$id, title=$title, body=$body");

    final response = await http.put(
      url,
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'id': id, 'title': title, 'body': body, 'userId': 1}),
    );

    print("📥 [UPDATE] Status Code: ${response.statusCode}");
    print("📥 [UPDATE] Response Body: ${response.body}");

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }

    print("❌ [UPDATE] Gagal update data!");
    return null;
  }

  // =========================
  // DELETE
  // =========================
  Future<bool> deletePost(int id) async {
    final url = Uri.parse('$baseUrl/posts/$id');

    print("🔴 [DELETE] URL: $url");
    print("📩 [DELETE] Menghapus ID: $id");

    final response = await http.delete(url);

    print("📥 [DELETE] Status Code: ${response.statusCode}");
    print("📥 [DELETE] Response Body: ${response.body}");

    if (response.statusCode == 200) {
      print("🟢 [DELETE] Berhasil menghapus data!");
      return true;
    }

    print("❌ [DELETE] Gagal menghapus data!");
    return false;
  }
}
