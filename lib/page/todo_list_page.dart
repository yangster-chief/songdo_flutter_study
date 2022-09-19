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
  // List<String> todoList = [
  //   'Flutter study 1주차 숙제 하기',
  //   'Flutter docs 정독하기',
  //   'FlutterFire 적용',
  // ];

  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          ListView.builder(
            itemCount: 255,
            itemBuilder: (BuildContext context, int index) =>
                _ListItem(item: '$index 번째 아이템'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
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
          ),
        ],
      );

  void _onPressed() {
    print(_todoController.text);
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({Key? key, required this.item}) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 56,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
