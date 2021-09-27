import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';

class TaskCard extends StatefulWidget {
  TaskCard(
      {@required this.task,
      @required this.description,
      @required this.isDone,
      @required this.date});

  final task;
  final description;
  final isDone;
  final date;

  @override
  State<TaskCard> createState() => _TaskCard();
}

class _TaskCard extends State<TaskCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.pink;
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  }),
              Container(
                margin: EdgeInsets.only(left: 16),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.pink,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(widget.date, style: TextStyle(color: Colors.pink)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.task),
                    Text(widget.description),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Divider(
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
