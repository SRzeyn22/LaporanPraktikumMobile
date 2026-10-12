import 'package:flutter/material.dart';
import 'package:modulAll/modul14/model/post_model.dart';
import 'package:modulAll/modul14/services/api_services.dart';
import '../widgets/post_card.dart';
import '../widgets/post_dialog.dart';

class HomePage14 extends StatefulWidget {
  const HomePage14({super.key});

  @override
  State<HomePage14> createState() => _HomePage14State();
}

class _HomePage14State extends State<HomePage14> {
  final ApiService apiService = ApiService();

  List<Post> posts = []; // <-- menampung semua post

  @override
  void initState() {
    super.initState();
    loadPosts(); // <-- ambil data pertama kali
  }

  // GET ALL DATA
  void loadPosts() async {
    List<Post> data = await apiService.getAllPosts();
    setState(() {
      posts = data;
    });
  }

  // CREATE
  void addPost() async {
    final result = await showPostDialog(context);

    if (result != null) {
      await apiService.createPost(result['title']!, result['body']!);
      loadPosts(); // reload after create
    }
  }

  // UPDATE
  void updatePost(Post post) async {
    final result = await showPostDialog(
      context,
      title: post.title,
      body: post.body,
    );

    if (result != null) {
      await apiService.updatePost(post.id, result['title']!, result['body']!);

      loadPosts(); // reload list
    }
  }

  // DELETE
  void deletePost(int id) async {
    await apiService.deletePost(id);
    loadPosts(); // refresh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CRUD API Flutter")),
      floatingActionButton: FloatingActionButton(
        onPressed: addPost,
        child: const Icon(Icons.add),
      ),

      body: posts.isEmpty
          ? const Center(child: Text("Belum ada data"))
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];

                return PostCard(
                  post: post,
                  onUpdate: () => updatePost(post),
                  onDelete: () => deletePost(post.id),
                );
              },
            ),
    );
  }
}
