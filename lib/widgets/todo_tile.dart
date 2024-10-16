import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/provider/todo_provider.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;

  const TodoTile({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: ListTile(
          title: Text(
            todo.title,
            style: TextStyle(
              decoration: todo.done
                  ? TextDecoration.lineThrough
                  : null, //Strike through if done
            ),
          ),
          trailing: Checkbox(
            value: todo.done,
            onChanged: (value) {
              if (value != null) {
                context
                    .read<TodoProvider>()
                    .toggleTodoStatus(todo.id); //Toggle status
              }
            },
          ),
        ),
      ),
    );
  }
}
