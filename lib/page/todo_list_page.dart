import 'package:flutter/material.dart';

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
  List<String> todoList = [];

  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) => _ListItem(
                item: todoList[index],
                onLongPress: (item) {
                  final result = showDialog<String>(
                    context: context,
                    builder: (context) => _TODOListCustomDialog(item: item),
                  );
                  print(result);
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
      todoList.add(_todoController.text);
      _todoController.clear();
    });
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.item,
    required this.onLongPress,
  }) : super(key: key);

  final String item;

  final void Function(String) onLongPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onLongPress: () {
          onLongPress(item);
        },
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: Center(
            child: Text(
              item,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class _TODOListCustomDialog extends StatelessWidget {
  const _TODOListCustomDialog({Key? key, required this.item}) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('할일 수정/삭제'),
        content: TextFormField(
          initialValue: item,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Delete'),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Confirm'),
            child: const Text('Confirm'),
          ),
        ],
      );
}
