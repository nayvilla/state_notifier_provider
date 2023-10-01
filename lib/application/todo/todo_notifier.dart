import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_riverpod/domain/todo_model.dart'; // Importa el modelo de tarea
import 'package:todo_list_riverpod/application/todo/todo_state.dart'; 
import 'package:todo_list_riverpod/application/todo/todo_event.dart'; 
import 'package:todo_list_riverpod/domain/lista_busqueda.dart'; // Importa el modelo de tarea
import 'package:uuid/uuid.dart'; // Importa la biblioteca para generar identificadores únicos

// Define el notifier para gestionar el estado de las tareas
class TodoNotifier extends StateNotifier<TodoState> {
  TodoNotifier() : super(TodoState.empty()); // Inicializa el estado del notifier con una lista de tareas vacía

  final uuid = const Uuid(); // Crea una instancia de Uuid para generar IDs únicos

  // Esta función se utiliza para mapear eventos a cambios en el estado
  void mapEventsToState(TodoEvent event) async {
    event.map(
      // Cuando se cambia el título de una tarea
      todoObservacionesChanged: (todoObservacionesChangedEvent) {
        state = state.copyWith(
          todo: TodoModel( id_estado_cuenta: state.todo.id_estado_cuenta, observaciones: todoObservacionesChangedEvent.text.trimLeft(), estadoVenta: state.todo.estadoVenta, fechaTansaccion: state.todo.fechaTansaccion, fechaVencimiento: state.todo.fechaVencimiento, debe: state.todo.debe, haber: state.todo.haber, saldo: state.todo.saldo, isTodoCompleted: false, 
          ),
        );
      },
      // Cuando se cambiala fecha de transaccion
      todoDateChanged: (todoDateChangedEvent) {
        state = state.copyWith(
          todo: TodoModel( id_estado_cuenta: state.todo.id_estado_cuenta, observaciones: state.todo.observaciones, estadoVenta: state.todo.estadoVenta, fechaTansaccion: todoDateChangedEvent.text.trimLeft(), fechaVencimiento: state.todo.fechaVencimiento, debe: state.todo.debe, haber: state.todo.haber, saldo: state.todo.saldo, isTodoCompleted: false,
          ),
      );
      }, 
      // Cambia el debe en el estado
      todoDebeChanged: (todoDebeChangedEvent) { 
        state = state.copyWith(
          todo: TodoModel( id_estado_cuenta: state.todo.id_estado_cuenta, observaciones: state.todo.observaciones, estadoVenta: state.todo.estadoVenta, fechaTansaccion: state.todo.fechaTansaccion, fechaVencimiento: state.todo.fechaVencimiento, debe: todoDebeChangedEvent.text.trimLeft(), haber: state.todo.haber, saldo: state.todo.saldo, isTodoCompleted: false,
          ),
      );
      },
      // Cambia el haber en el estado
      todoHaberChanged: (todoHaberChangedEvent) {
        state = state.copyWith(
          todo: TodoModel( id_estado_cuenta: state.todo.id_estado_cuenta, observaciones: state.todo.observaciones, estadoVenta: state.todo.estadoVenta, fechaTansaccion: state.todo.fechaTansaccion, fechaVencimiento: state.todo.fechaVencimiento, haber: todoHaberChangedEvent.text.trimLeft(), debe: state.todo.debe, saldo: state.todo.saldo, isTodoCompleted: false,
          ),
        );
      },
      // Cuando se cambiala fecha de vencimiento
      todoDateVenChanged: (todoDateVenChangedEvent) {
        state = state.copyWith(
          todo: TodoModel( id_estado_cuenta: state.todo.id_estado_cuenta, observaciones: state.todo.observaciones, estadoVenta: state.todo.estadoVenta, fechaVencimiento: todoDateVenChangedEvent.text.trimLeft(), fechaTansaccion: state.todo.fechaTansaccion, debe: state.todo.debe, haber: state.todo.haber, saldo: state.todo.saldo, isTodoCompleted: false,
          ),
      );
      },
      // Cuando se cambia el estado de venta
      todoEstadoVenChanged: (todoEstadoVenChangedEvent) {
        state = state.copyWith(
          todo: TodoModel( id_estado_cuenta: state.todo.id_estado_cuenta, observaciones: state.todo.observaciones, fechaVencimiento: state.todo.fechaVencimiento, estadoVenta: todoEstadoVenChangedEvent.text.trimLeft(), fechaTansaccion: state.todo.fechaTansaccion, debe: state.todo.debe, haber: state.todo.haber, saldo: state.todo.saldo, isTodoCompleted: false,
          ),
      );
      },  
      todoSaldoChanged: (todoSaldoChangedEvent) {
        state = state.copyWith(
          todo: TodoModel( id_estado_cuenta: state.todo.id_estado_cuenta, observaciones: state.todo.observaciones, fechaVencimiento: state.todo.fechaVencimiento, estadoVenta: state.todo.estadoVenta, fechaTansaccion: state.todo.fechaTansaccion, debe: state.todo.debe, haber: state.todo.haber, saldo: todoSaldoChangedEvent.text.trimLeft(), isTodoCompleted: false,
          ),
      );
      },
      todoBusquedaChanged: (todoBusquedaChangedEvent) {
        state = state.copyWith(
          busqueda: BusquedaModel( busqueda: todoBusquedaChangedEvent.text.trimLeft(), ),
      );
      },
      // Cuando se cambia el estado de una tarea
      todoStatusChanged: (todoStatusChangedEvent) {
        // Encuentra la tarea seleccionada en la lista de tareas actual
        final selectedTodo = state.todoList.where((element) => element.id_estado_cuenta == todoStatusChangedEvent.todoId).single;
        final todolist = [...state.todoList]; // Crea una copia de la lista de tareas

        // Actualiza el estado de la tarea seleccionada
        todolist[todolist.indexWhere((element) => element.id_estado_cuenta == selectedTodo.id_estado_cuenta)] =
            TodoModel(id_estado_cuenta: selectedTodo.id_estado_cuenta, observaciones: selectedTodo.observaciones, estadoVenta: selectedTodo.estadoVenta, fechaTansaccion: selectedTodo.fechaTansaccion, fechaVencimiento: selectedTodo.fechaVencimiento, debe: selectedTodo.debe ,haber: selectedTodo.haber, saldo: selectedTodo.saldo, isTodoCompleted: !selectedTodo.isTodoCompleted);

        state = state.copyWith(todoList: todolist); // Actualiza el estado con la nueva lista de tareas
      },
      // Cuando se agrega una nueva tarea
      addTodo: (addTodoEvent) {
        final List<TodoModel> todoList = [...state.todoList]; // Crea una copia de la lista de tareas actual
        todoList.add(
          TodoModel(
            id_estado_cuenta: uuid.v1(), // Genera un nuevo ID único para la tarea
            observaciones: state.todo.observaciones,
            fechaTansaccion: state.todo.fechaTansaccion,
            debe: state.todo.debe,
            haber: state.todo.haber,
            saldo: state.todo.saldo,
            estadoVenta: state.todo.estadoVenta,
            fechaVencimiento: state.todo.fechaVencimiento,
            isTodoCompleted: false, // Inicializa como no completada
          ),
        );
        state = state.copyWith(todoList: todoList); // Actualiza el estado con la nueva lista de tareas
      },
      // Cuando se elimina una tarea
      removeTodo: (removeTodoEvent) {
        final List<TodoModel> todoList = [...state.todoList]; // Crea una copia de la lista de tareas actual
        final todoId = removeTodoEvent.todoId; // Obtiene el ID de la tarea a eliminar

        // Elimina la tarea de la lista basada en su ID
        todoList.removeWhere((element) => element.id_estado_cuenta == todoId);

        state = state.copyWith(todoList: todoList); // Actualiza el estado con la nueva lista de tareas
      },

      editarTodo: (editarTodoEvent) {
        final selectedTodo = state.todoList.where((element) => element.id_estado_cuenta == editarTodoEvent.todoId).single;
        //final todolist = [...state.todoList];

        print("ID: ${selectedTodo.id_estado_cuenta}");
        print("Observaciones: ${selectedTodo.observaciones}");
        print("Fecha de Transacción: ${selectedTodo.fechaTansaccion}");
      },
    );
  }
}



// class SearchNotifier extends StateNotifier<SearchState> {
//   SearchNotifier() : super(SearchState.empty());

//   void mapEventsToState(SearchEvent event) {
//     event.map(
//       searchedTextChanged: (searchedTextChangedEvent) {
   
//         final characterList = [...state.characterList];
//         final searchedCharacterList = characterList
//             .where((characterModel) => characterModel.observaciones
//                 .toLowerCase()
//                 .contains(searchedTextChangedEvent.text.toLowerCase().trimLeft()))
//             .toList();
  
//         state = state.copyWith(characterList: searchedCharacterList);
//       },

//       updateListItems: (updateListItemsEvent) {
//         state = state.copyWith(
//           characterList: updateListItemsEvent.characterModelList,
          
//         );
//       },
//     );
//   }
// }


///Clase para busqueda
class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState.empty());

  void mapEventsToState(SearchEvent event) {
    event.map(
      searchedTextChanged: (searchedTextChangedEvent) {
   
        final characterList = [...state.characterList];
        final searchedCharacterList = characterList
            .where((characterModel) => characterModel.observaciones
                .toLowerCase()
                .contains(searchedTextChangedEvent.text.toLowerCase().trimLeft()))
            .toList();
  
        state = state.copyWith(characterList: searchedCharacterList);
      },

      updateListItems: (updateListItemsEvent) {
        state = state.copyWith(
          characterList: updateListItemsEvent.characterModelList,
          
        );
      },
    );
  }
}