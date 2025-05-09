
class Todo {
  final String id;
  final String title;

  Todo({
    required this.id, 
    required this.title});

  factory Todo.fromFirestore(Map<String, dynamic> data, String documentid) {
    return Todo(id: documentid, title: data['title'] ?? '');
  }

  Map<String, dynamic> ToFirestore() {
    return {
      'title': title,
    };
  }
}
