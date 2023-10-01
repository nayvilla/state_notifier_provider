import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/application/todo/todo_event.dart';
import 'package:todo_list_riverpod/domain/todo_model.dart';
import 'package:todo_list_riverpod/domain/lista_busqueda.dart';
import 'package:todo_list_riverpod/presentation/pages/home_page/constants/colors.dart';
import 'package:todo_list_riverpod/providers/todo_provider.dart';
import 'package:todo_list_riverpod/presentation/pages/home_page/widgets/todos_action_part.dart';
import 'package:todo_list_riverpod/presentation/pages/home_page/widgets/custom/custom_BuscadorTransacciones.dart';

class TodosPart extends ConsumerWidget {
  final List<TodoModel> todoList;

  const TodosPart({
    Key? key,
    required this.todoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController controllerB = TextEditingController();
    final List<CharacterModel> characterList = ref.watch(searchProvider).characterList;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: CustomBuscadorTransacciones(
                  'Buscar cliente...',
                  controller: controllerB,
                  onChanged: (text) {
                    ref.read(todoNotifierProvider.notifier).mapEventsToState(
                      TodoBusquedaChanged(text: controllerB.value.text),
                    );
                    print(controllerB.value.text);
                  },
                  onPressed: () {
                    if (controllerB.text.isEmpty) {
                      ref.refresh(searchProvider);
                    } else {
                      ref.refresh(searchProvider);
                      ref.read(searchProvider.notifier).mapEventsToState(
                        SearchedTextChanged(
                          text: controllerB.text,
                        ),
                      );
                      controllerB.text = "";
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  openMyForm(context, todoList); // Pasar la lista de tareas
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: const Color.fromARGB(255, 18, 79, 160),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(16),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Nueva cuenta Cliente"),
                    SizedBox(width: 8),
                    Icon(Icons.add),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        todoList.isEmpty
            ? const Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  "No se encontro estados de cuenta",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              )
            : SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text("ID")),
                        DataColumn(label: Text("Fecha Transacción")),
                        DataColumn(label: Text("Debe")),
                        DataColumn(label: Text("Haber")),
                        DataColumn(label: Text("Saldo")),
                        DataColumn(label: Text("Estado Venta")),
                        DataColumn(label: Text("Fecha Vencimiento")),
                        DataColumn(label: Text("Observaciones")),
                        DataColumn(label: Text("Descripción")),
                        DataColumn(label: Text("Acciones")),
                      ],
                      rows: characterList.map((todo) {
                        final todoItem = todoList.firstWhere((item) => item.id_estado_cuenta == todo.id_estado_cuenta); // Obtener la tarea correspondiente
                        return DataRow(
                          cells: [
                            DataCell(Text(todo.id_estado_cuenta)),
                            DataCell(Text(todo.fechaTansaccion)),
                            DataCell(Text(todo.debe.toString())),
                            DataCell(Text(todo.haber.toString())),
                            DataCell(
                              Text(
                                (double.parse(todo.debe) - double.parse(todo.haber)).toStringAsFixed(2),
                                style: TextStyle(
                                  color: double.parse(todo.debe) < double.parse(todo.haber) ? Colors.red : Colors.black,
                                ),
                              ),
                            ),
                            DataCell(Text(todo.estadoVenta)),
                            DataCell(Text(todo.fechaVencimiento)),
                            DataCell(Text(todo.observaciones)),
                            DataCell(
                              Checkbox(
                                checkColor: blackColor,
                                fillColor: MaterialStateProperty.all(whiteColor),
                                value: todo.isTodoCompleted,
                                onChanged: (isTodoCompleted) {
                                  ref.read(todoNotifierProvider.notifier).mapEventsToState(
                                    TodoStatusChanged(todoId: todoItem.id_estado_cuenta), // Usar el ID de la tarea correspondiente
                                  );
                                },
                              ),
                            ),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Puedes usar el ID de la tarea correspondiente aquí
                                      // ref.read(todoNotifierProvider.notifier).mapEventsToState(
                                      //   EditarTodo(
                                      //     todoId: todoItem.id, // Usar el ID de la tarea correspondiente
                                      //   ),
                                      // );
                                      final todoItem = todoList.firstWhere((item) => item.id_estado_cuenta == todo.id_estado_cuenta);
                                      print(todoItem);
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Puedes usar el ID de la tarea correspondiente aquí
                                      ref.read(todoNotifierProvider.notifier).mapEventsToState(
                                        RemoveTodo(
                                          todoId: todoItem.id_estado_cuenta, // Usar el ID de la tarea correspondiente
                                        ),
                                      );
                                      //print(todoItem.id_estado_cuenta);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}

Future<bool> openMyForm(BuildContext context, List<TodoModel> todoList) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          children: [
            TodosActionPart(
              todoItem: todoList.isNotEmpty ? todoList[0] : TodoModel.empty(),
            ),
          ],
        ),
      );
    },
  );
  return true;
}


///Funcion para actualizar
Future<void> openEditForm(BuildContext context, TodoModel todoItem) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          children: [
            TodosActionPart(todoItem: todoItem), // Pasa el objeto todoItem a la interfaz de edición
          ],
        ),
      );
    },
  );
}