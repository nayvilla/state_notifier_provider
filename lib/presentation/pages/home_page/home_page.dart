import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/domain/todo_model.dart';
import 'package:todo_list_riverpod/presentation/pages/home_page/widgets/todos_part.dart';
import 'package:todo_list_riverpod/providers/todo_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoNotifierProvider.select((state) => state.todoList));
    final reversedTodoList = List<TodoModel>.from(todoList.reversed);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //TodosActionPart(),
              TodosPart(todoList: reversedTodoList),
            ],
          ),
        ),
      ),
    );
  }
}
