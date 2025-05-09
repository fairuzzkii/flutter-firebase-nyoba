import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/todo.dart';

class FirebaseService {
  final CollectionReference _todoRef = FirebaseFirestore.instance.collection(
    'todos',
  );

  Future<List<Todo>> getTodos() async {
    final snapshot = await _todoRef.get();
    return snapshot.docs
        .map(
          (doc) =>
              Todo.fromFirestore(doc.data() as Map<String, dynamic>, doc.id),
        )
        .toList();
  }
}
