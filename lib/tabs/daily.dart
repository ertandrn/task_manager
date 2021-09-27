import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/components/task_card.dart';

class Daily extends StatefulWidget {
  const Daily({Key? key}) : super(key: key);

  @override
  State<Daily> createState() => _Daily();
}

class _Daily extends State<Daily> {
  late List<Task> data;

  @override
  void initState() {
    data = Task.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Task.data.sort((Task a, Task b) => a.date.compareTo(b.date));
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          Task task = data[index];

          return Dismissible(
            key: Key(task.id.toString()),
            onDismissed: (direction) {
              setState(() {
                data.removeAt(index);
              });
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Task removed")));
            },
            background: Container(color: Colors.red),
            child: TaskCard(
              task: task.task,
              description: task.description,
              isDone: task.isDone,
              date: task.date,
            ),
          );
        });
  }
}
