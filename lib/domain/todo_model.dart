import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_riverpod/presentation/pages/home_page/constants/constants.dart';

part 'todo_model.freezed.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    // ignore: non_constant_identifier_names
    required String id_estado_cuenta,
    required String fechaTansaccion,
    required String debe,
    required String haber,
    required String saldo,
    required String estadoVenta,
    required String fechaVencimiento,
    required String observaciones,   
    required bool isTodoCompleted,
    
  }) = _TodoModel;

  const TodoModel._();

  factory TodoModel.empty() => TodoModel(
        id_estado_cuenta: "",
        fechaTansaccion: Constants.fechaActual,
        debe: Constants.debe,
        haber: Constants.haber,
        saldo: Constants.saldo,
        estadoVenta:Constants.selectedEstadoVenta,
        fechaVencimiento: Constants.fechaActual,
        observaciones: Constants.observaciones,
        isTodoCompleted: false,
      );
}
