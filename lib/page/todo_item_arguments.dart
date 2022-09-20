import 'package:flutter_study/page/todo_list_page.dart';

///
/// flutter_study
/// File Name: todo_item_arguments
/// Created by sujangmac on 2022/09/20
///
/// Description:
///
class TODOItemArguments {
  final bool isDelete;
  final bool isUpdate;
  final int index;
  final TaskItem item;

  const TODOItemArguments({
    this.isDelete = false,
    this.isUpdate = false,
    required this.index,
    required this.item,
  });
}
