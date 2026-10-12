import 'package:flutter/material.dart';

Future<Map<String, String>?> showPostDialog(
  BuildContext context, {
  String title = "",
  String body = "",
}) async {
  final titleController = TextEditingController(text: title);
  final bodyController = TextEditingController(text: body);

  return showDialog<Map<String, String>>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title.isEmpty ? "Tambah Post" : "Update Post"),
        content: SizedBox(
          height: 150,
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Judul"),
              ),
              TextField(
                controller: bodyController,
                decoration: const InputDecoration(labelText: "Isi"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, {
                'title': titleController.text,
                'body': bodyController.text,
              });
            },
            child: const Text("Simpan"),
          ),
        ],
      );
    },
  );
}
