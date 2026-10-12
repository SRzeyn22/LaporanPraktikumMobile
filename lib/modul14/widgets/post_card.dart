import 'package:flutter/material.dart';
import 'package:modulAll/modul14/model/post_model.dart';

// import '../models/post_model.dart';

String formatDate(DateTime? dt) {
  if (dt == null) return '';
  final y = dt.year.toString().padLeft(4, '0');
  final m = dt.month.toString().padLeft(2, '0');
  final d = dt.day.toString().padLeft(2, '0');
  final hh = dt.hour.toString().padLeft(2, '0');
  final mm = dt.minute.toString().padLeft(2, '0');
  return '$y-$m-$d $hh:$mm';
}

class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback onUpdate;
  final VoidCallback onDelete;

  const PostCard({
    super.key,
    required this.post,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        title: Text(post.title, style: const TextStyle(fontSize: 20)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.body),
            const SizedBox(height: 10),
            Text(
              "Created: ${formatDate(post.createdAt)}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == "update") onUpdate();
            if (value == "delete") onDelete();
          },
          itemBuilder: (context) => [
            const PopupMenuItem(value: "update", child: Text("Update")),
            const PopupMenuItem(value: "delete", child: Text("Delete")),
          ],
        ),
      ),
    );
  }
}
