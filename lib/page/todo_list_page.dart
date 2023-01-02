import 'package:flutter/material.dart';
import 'package:flutter_study/page/todo_item_arguments.dart';
import 'package:flutter_study/page/todo_item_page.dart';

///
/// flutter_study
/// File Name: todo_list_page
/// Created by sujangmac on 2022/09/19
///
/// Description:
///
class TODOListPage extends StatefulWidget {
  const TODOListPage({Key? key}) : super(key: key);

  @override
  State<TODOListPage> createState() => _TODOListPageState();
}

class _TODOListPageState extends State<TODOListPage> {
  List<TaskItem> todoList = [];

  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) => _ListItem(
                item: todoList[index],
                onLongPress: (item) async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute<TODOItemArguments>(
                      builder: (context) =>
                          TODOItemPage(item: item, index: index),
                    ),
                  );
                  if (result != null && result.isUpdate) {
                    setState(() {
                      todoList[result.index] = result.item;
                    });
                  }
                  if (result != null && result.isDelete) {
                    setState(() {
                      todoList.removeAt(result.index);
                    });
                  }
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _todoController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: '할일 입력'),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 72,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _onPressed,
                    child: const Text('add'),
                  ),
                )
              ],
            ),
          ),
        ],
      );

  void _onPressed() {
    setState(() {
      todoList.add(TaskItem(_todoController.text, null));
      _todoController.clear();
    });
  }
}

class TaskItem {
  String title;
  bool isFinished = false;
  DateTime? dateTime;

  TaskItem(this.title, this.dateTime);
}

class _ListItem extends StatefulWidget {
  const _ListItem({
    Key? key,
    required this.item,
    required this.onLongPress,
  }) : super(key: key);

  final TaskItem item;

  final void Function(TaskItem) onLongPress;

  @override
  State<_ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<_ListItem> {
  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      widget.item.title,
      textAlign: TextAlign.center,
    );

    if (widget.item.isFinished) {
      title = Text(
        widget.item.title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            decoration: TextDecoration.lineThrough, color: Colors.grey),
      );
    } else if (widget.item.dateTime != null) {
      final now = DateTime.now();
      final diff = widget.item.dateTime!.difference(now);
      if (diff.inDays < 0) {
        title = Text(
          widget.item.title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.red),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onLongPress: () {
          widget.onLongPress(widget.item);
        },
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: Row(
            children: [
              Checkbox(
                value: widget.item.isFinished,
                onChanged: (value) {
                  setState(() {
                    widget.item.isFinished = value ?? false;
                  });
                },
              ),
              Center(
                child: title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
