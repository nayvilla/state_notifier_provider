import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_riverpod/domain/lista_busqueda.dart';

part 'todo_event.freezed.dart';

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.todoObservacionesChanged({required String text}) = TodoObservacionesChanged;
  const factory TodoEvent.todoDateChanged({required String text}) = TodoDateChanged;
  const factory TodoEvent.todoDebeChanged({required String text}) = TodoDebeChanged;
  const factory TodoEvent.todoHaberChanged({required String text}) = TodoHaberChanged;
  const factory TodoEvent.todoSaldoChanged({required String text}) = TodoSaldoChanged;
  const factory TodoEvent.todoEstadoVenChanged({required String text}) = TodoEstadoVenChanged;
  const factory TodoEvent.todoStatusChanged({required String todoId}) = TodoStatusChanged;
  const factory TodoEvent.todoDateVenChanged({required String text}) = TodoDateVenChanged;
  const factory TodoEvent.todoBusquedaChanged({required String text}) = TodoBusquedaChanged;  
  const factory TodoEvent.addTodo() = AddTodo;
  const factory TodoEvent.removeTodo({required String todoId}) = RemoveTodo;
  const factory TodoEvent.editarTodo({required String todoId}) = EditarTodo;
}

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.searchedTextChanged({required String text}) = SearchedTextChanged;
  const factory SearchEvent.updateListItems({required List<CharacterModel> characterModelList}) = UpdateListItems;
}