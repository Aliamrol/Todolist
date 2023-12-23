class Task {
  late String title;
  String? description = "no description";
  bool isDone = false;
  final int id;

  Task({required this.title, required this.id, this.description});
}
