import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/application/todo/todo_event.dart';
import 'package:todo_list_riverpod/application/todo/todo_notifier.dart';
import 'package:todo_list_riverpod/providers/todo_provider.dart';
import 'package:todo_list_riverpod/domain/todo_model.dart';
import 'package:todo_list_riverpod/presentation/pages/home_page/constants/constants.dart'; 
import 'package:todo_list_riverpod/presentation/pages/home_page/widgets/custom/custom_date_input.dart';
import 'package:todo_list_riverpod/presentation/pages/home_page/widgets/custom/custom_dropdown.dart';
import 'package:todo_list_riverpod/presentation/pages/home_page/widgets/custom/custom_text_field.dart';
import 'package:todo_list_riverpod/presentation/pages/home_page/widgets/custom/custom_switch_with_label.dart';

// ignore: must_be_immutable
class TodosActionPart extends ConsumerWidget {
  final TodoModel todoItem;
  TextEditingController debeC = TextEditingController();
  TextEditingController haberC = TextEditingController();
  TextEditingController saldoC = TextEditingController();
  
  TodosActionPart({
    Key? key,
    required this.todoItem,
  }) : super(key: key);
  
  //final esSaldoNegativoProvider = Provider<bool>((ref) => false);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final esSaldoNegativo = ref.watch(esSaldoNegativoProvider);
    List<String> estadoVentaOptions = Constants.estadoVentaOptions;
    String? selectedEstadoVenta = Constants.selectedEstadoVenta;
    String? fechaTransaccion = Constants.fechaActual;
    String? fechaVencimiento = Constants.fechaActual;
    bool light = Constants.light;
    //final textfieldController = TextEditingController();
    TextEditingController observacionC = TextEditingController();
    List<TextEditingController> controllers = [debeC, haberC, saldoC, observacionC];
    

    // Calcula el saldo automáticamente
    void calcularSaldo() {
      final debe = double.tryParse(debeC.text) ?? 0.0;
      final haber = double.tryParse(haberC.text) ?? 0.0;
      final saldo = debe - haber;
      ref.read(esSaldoNegativoProvider.notifier).actualizarValor(saldo < 0);
      ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoSaldoChanged(text: saldo.toString(),));
      saldoC.text = saldo.toStringAsFixed(2); // Actualiza el campo "Saldo"
      
    }
    final saldoColor = esSaldoNegativo ? Colors.red : Colors.black;
    // Agrega un listener para calcular el saldo cuando cambie "Debe" o "Haber"
    debeC.addListener(calcularSaldo);
    haberC.addListener(calcularSaldo);

    return Column(
      children: [
        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customDateInput(
                      'Fecha Transacción',
                      'Seleccione la fecha de transacción',
                      fechaTransaccion,
                      (String? value) {
                        fechaTransaccion = value;
                        ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoDateChanged(text: fechaTransaccion ?? ''),);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customDropdown('Estado de Venta', estadoVentaOptions, selectedEstadoVenta, 
                    (String? value) {
                      selectedEstadoVenta = value;
                      ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoEstadoVenChanged(text: selectedEstadoVenta ?? ''),);
                    }),
                  ),
                ),
              ],
            ),
        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customNumericTextField(
                              'Debe', 'Ingrese el debe', 10, controller: debeC,
                              onChanged: (text) {
                                ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoDebeChanged(text: debeC.value.text),);
                                //calcularSaldo();
                              },
                            ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customNumericTextField(
                              'Haber', 'Ingrese el haber', 10, controller: haberC,
                               onChanged: (text) {
                                ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoHaberChanged(text: text),);
                              }, 
                            ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customNumericTextField('Saldo', 'Saldo calculado', 20, controller: saldoC, style: TextStyle( color: saldoColor, ),),
                  ),
                ),
              ],
            ),
        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customDateInput(
                      'Fecha Vencimiento',
                      'Seleccione la fecha de vencimiento',
                      fechaVencimiento,
                      (String? value) {
                        fechaVencimiento = value;
                        ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoDateVenChanged(text: fechaVencimiento ?? ''),);
                        print(todoItem.id_estado_cuenta);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customTextField(
                      'Observación', 'Ingrese cualquier observación', 100, controller: observacionC, 
                      onChanged: (text) {
                        ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoObservacionesChanged(text: observacionC.value.text),);
                      },
                      ),
                  ),
                ),
              ],
            ),
        // Agregar etiquetas, interruptor y botones
        Row(  
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: customSwitchWithLabel('Estado', light, (bool value) {
                      ref.read(todoNotifierProvider.notifier).mapEventsToState(TodoDateChanged(text: fechaTransaccion ?? ''));
                    }),
                  ),  
                ),
              ],
        ),
        Row(  
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                         padding: const EdgeInsets.all(15),
                  child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  constraints: const BoxConstraints(
                    //maxWidth: 770,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: const Color.fromARGB(255, 18, 79, 160),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(16),
                        ),
                        child: const Text('Cancelar', style: TextStyle(fontSize: 14)),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(todoNotifierProvider.notifier).mapEventsToState(
                                const AddTodo(),
                              );
                          for (var controller in controllers) {
                            controller.clear();
                          }
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: const Color.fromARGB(255, 18, 79, 160),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(16),
                        ),
                        child: const Text('Guardar', style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                ),
                ),
                ),
                
              ],
        ),        
    ],
    );
  }
}