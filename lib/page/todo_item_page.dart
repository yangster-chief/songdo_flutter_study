import 'package:flutter/material.dart';
import 'package:flutter_study/page/todo_item_arguments.dart';
import 'package:flutter_study/page/todo_list_page.dart';

///
/// flutter_study
/// File Name: todo_item_page
/// Created by sujangmac on 2022/09/20
///
/// Description:
///
class TODOItemPage extends StatefulWidget {
  const TODOItemPage({Key? key, required this.item, required this.index})
      : super(key: key);

  final TaskItem item;
  final int index;

  @override
  State<TODOItemPage> createState() => _TODOItemPageState();
}

class _TODOItemPageState extends State<TODOItemPage> {
  final _todoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _todoController.text = widget.item.title;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    TODOItemArguments(
                        item: widget.item, index: widget.index, isDelete: true),
                  );
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _todoController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: '할일 입력'),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Center(
                    child: Text(
                      '완료 여부',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Checkbox(
                    value: widget.item.isFinished,
                    onChanged: (value) {
                      setState(() {
                        widget.item.isFinished = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('마감 기한'),
                  const SizedBox(width: 16),
                  Expanded(
                      child: Text(
                    widget.item.dateTime
                            ?.toString()
                            .replaceAll('00:00:00.000', '') ??
                        '비어있음',
                    style: const TextStyle(color: Colors.grey),
                  )),
                  const SizedBox(width: 16),
                  OutlinedButton(
                      onPressed: () async {
                        final result = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2023));

                        setState(() {
                          widget.item.dateTime = result;
                        });
                      },
                      child: const Text('마감 기한 설정')),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.item.title = _todoController.text;
            Navigator.pop(
              context,
              TODOItemArguments(
                  item: widget.item, index: widget.index, isUpdate: true),
            );
          },
          child: const Icon(Icons.save),
        ),
      );
}
