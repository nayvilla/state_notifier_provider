import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_riverpod/presentation/pages/home_page/constants/constants.dart';

part 'lista_busqueda.freezed.dart';

@freezed
class CharacterModel with _$CharacterModel {
  factory CharacterModel({
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
  }) = _CharacterModel;
  const CharacterModel._();

  factory CharacterModel.empty() => CharacterModel(
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


@freezed
class BusquedaModel with _$BusquedaModel {
  factory BusquedaModel({
    required String busqueda,
  }) = _BusquedaModel;
  const BusquedaModel._();

  factory BusquedaModel.empty() => BusquedaModel(
        busqueda: "",
    );
}
