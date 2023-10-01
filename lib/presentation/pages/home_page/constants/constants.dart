// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

String obtenerFechaActual() {
  final now = DateTime.now();
  final formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(now);
}

class Constants {
  static const bool light = true;
  static const String selectedEstadoVenta = 'Sin Pagar';
  static const String etiqueta = 'Agregar';
  static const String observaciones = 'Sin observaciones';
  static String? fechaTransaccion;
  static String? fechaVencimiento;
  static const String debe = "0.0";
  static const String haber = "0.0";
  static const String saldo = "0.0";
  static String fechaActual = obtenerFechaActual();
  static final List<String> metodoPagoOptions = ['Efectivo', 'Tarjeta', 'Transferencia'];
  static final List<String> estadoVentaOptions = ['Sin Pagar', 'Pagado', 'Pago parcial'];
}


