import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/application/todo/todo_event.dart';
import 'package:todo_list_riverpod/application/todo/todo_notifier.dart';
import 'package:todo_list_riverpod/application/todo/todo_state.dart';
import 'package:todo_list_riverpod/domain/todo_model.dart';
import 'package:todo_list_riverpod/domain/lista_busqueda.dart'; 

final todoNotifierProvider = StateNotifierProvider<TodoNotifier, TodoState>(
  (ref) {
    return TodoNotifier();
  },
);

///Saldo negativo
class EsSaldoNegativoNotifier extends StateNotifier<bool> {
  EsSaldoNegativoNotifier() : super(false); // Inicializa en false por defecto

  void actualizarValor(bool nuevoValor) {
    state = nuevoValor;
  }
}
final esSaldoNegativoProvider = StateNotifierProvider<EsSaldoNegativoNotifier, bool>((ref) {
  return EsSaldoNegativoNotifier();
});

final searchNotifierProvider = StateNotifierProvider<SearchNotifier, SearchState>(
  (ref) {
    return SearchNotifier();
    
  },
);

///Busqueda
///
///
///
 final todoListProvider = Provider<List<TodoModel>>((ref) {
  final todoState = ref.watch(todoNotifierProvider);
  return todoState.todoList;
});

final charactersDatasProvider = FutureProvider.autoDispose<List<CharacterModel>>(
  (ref) async {
    final List<TodoModel> todoList = ref.watch(todoListProvider);
    final List<CharacterModel> characterList = todoList.map((todo) {
      return CharacterModel(
        id_estado_cuenta: todo.id_estado_cuenta,
        fechaTansaccion: todo.fechaTansaccion,
        debe: todo.debe,
        haber: todo.haber,
        saldo: todo.saldo,
        estadoVenta: todo.estadoVenta,
        fechaVencimiento: todo.fechaVencimiento,
        observaciones: todo.observaciones,
        isTodoCompleted: false,
      );
    }).toList();

    return characterList;
  },
);


final searchProvider = StateNotifierProvider.autoDispose<SearchNotifier, SearchState>(
  (ref) {
    final characterModelList = ref.watch(charactersDatasProvider).whenOrNull(data: (data) => data);

    return SearchNotifier()
      ..mapEventsToState(
        UpdateListItems(
          characterModelList: characterModelList ?? [],
        ),
      );
  },
);