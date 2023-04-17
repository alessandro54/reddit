import 'package:flutter/material.dart';
import 'package:reddit/providers/reddit/get_token.dart';
import 'package:reddit/widgets/shared/layout.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  @override
  toString() {
    return 'Todo { userId: $userId, id: $id, title: $title, completed: $completed }';
  }
}

Future<List<Todo>> fetchTodos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((todo) => Todo.fromJson(todo)).toList();
  } else {
    throw Exception('Failed to load todos from API');
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(todo.title);
  }
}

class _HomeState extends State<Home> {
  late Future<List<Todo>> futureTodos;
  late Future<String> message;

  @override
  void initState() {
    super.initState();
    futureTodos = fetchTodos();
    message = getToken(
        'indifference44', 'UlD14OcsehAI7vDsz04bUtWs!2hzFwk9WD%24Sk1i8');
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        topBar: FutureBuilder<String>(
          future: message,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
        child: Expanded(
            child: FutureBuilder<List<Todo>>(
                future: futureTodos,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: 40,
                              color: Colors.amber,
                              child: Center(
                                child: Text(snapshot.data![index].title),
                              ));
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                })));
  }
}
