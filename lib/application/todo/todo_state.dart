import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_riverpod/domain/todo_model.dart';
import 'package:todo_list_riverpod/domain/lista_busqueda.dart';

part 'todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  factory TodoState({
    required List<TodoModel> todoList, // Lista de tareas
    required TodoModel todo, // Tarea actual
    required BusquedaModel busqueda,
  }) = _TodoState; 

  const TodoState._();

  factory TodoState.empty() => TodoState(
        todoList: [], // Inicializa la lista de tareas como vacía
        todo: TodoModel.empty(), // Inicializa la tarea actual como vacía
        busqueda: BusquedaModel.empty(),
      );
}

@freezed
class SearchState with _$SearchState {
  factory SearchState({
    required List<CharacterModel> characterList,
    required List<BusquedaModel> busquedaList,
  }) = _SearchState;
  const SearchState._();

  factory SearchState.empty() => SearchState(
        characterList: [],
        busquedaList: [],
      );
}