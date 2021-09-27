import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/tabs/daily.dart';
import 'package:task_manager/tabs/weekly.dart';
import 'package:task_manager/tabs/yearly.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreen();
}

class _TasksScreen extends State<TasksScreen> {
  final _formKey = GlobalKey<FormState>();

  late String task;
  late String description;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const SliverAppBar(
                title: Text("Task Manager"),
                pinned: true,
                floating: true,
                bottom: TabBar(
                  //isScrollable: true,
                  tabs: [
                    Tab(child: Text("Daily")),
                    Tab(child: Text("Weekly")),
                    Tab(child: Text("Yearly")),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: <Widget>[
              Daily(),
              Weekly(),
              Yearly(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              TextFormField(
                                initialValue: "",
                                validator: (value) {
                                  if (value == "") {
                                    return "Task required";
                                  }
                                },
                                onSaved: (value) {
                                  task = value!;
                                },
                                decoration: InputDecoration(
                                  labelText: "Task",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              Container(margin: EdgeInsets.all(8)),
                              TextFormField(
                                initialValue: "",
                                validator: (value) {
                                  if (value == "") {
                                    return "Description required";
                                  }
                                },
                                onSaved: (value) {
                                  description = value!;
                                },
                                decoration: InputDecoration(
                                  labelText: "Description",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              Container(margin: EdgeInsets.all(8)),
                              ElevatedButton(
                                child: const Text("Save"),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    Task.data.add(Task(
                                      id: task.length,
                                      date: "2021-01-09",
                                      task: task,
                                      description: description,
                                      isDone: false,
                                    ));
                                    Navigator.pop(context);
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ));
                },
              );
            },
            isExtended: true,
            label: const Text('Create'),
            icon: const Icon(Icons.create),
            backgroundColor: Colors.pink),
      ),
    );
  }
}
