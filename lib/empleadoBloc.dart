import 'dart:async';
import 'empleado.dart';

class EmpleadoBlock {
  List<Empleado> _empleadoList = [
    Empleado(1, "empleado 1", 1000.00),
    Empleado(2, "empleado 2", 2000.00),
    Empleado(3, "empleado 3", 3000.00),
    Empleado(4, "empleado 4", 4000.00),
    Empleado(5, "empleado 5", 5000.00),
  ];

  //Streams Cotroller
  final _empleadoListStreamController = StreamController<List<Empleado>>();

  final _empleadoSalarioIncrementStreamController = StreamController<Empleado>();
  final _empleadoSalarioDecrementStreamController = StreamController<Empleado>();

  //Getters: streams y sinks
  Stream <List<Empleado>> get empleadoListStream => _empleadoListStreamController.stream;
  StreamSink <List<Empleado>> get empleadoListSink => _empleadoListStreamController.sink;

  StreamSink <Empleado> get empleadoSalarioIncrement => _empleadoSalarioIncrementStreamController.sink;


  //Constructor
  EmpleadoBlock(){
    _empleadoListStreamController.add(_empleadoList);
    _empleadoSalarioDecrementStreamController.stream.listen(_incrementSalario);
    _empleadoSalarioIncrementStreamController.stream.listen(_decrementSalario);
  }

  //funciones principales (core funtion)
  _incrementSalario(Empleado empleado){
    double salarioActual = empleado.salario;
    double salarioIncrement = salarioActual * 20/100;

    _empleadoList[empleado.id - 1].salario = salarioActual + salarioIncrement;
    empleadoListSink.add(_empleadoList);
  }

  _decrementSalario(Empleado empleado){
    double salarioActual = empleado.salario;
    double salarioIncrement = salarioActual * 20/100;

    _empleadoList[empleado.id - 1].salario = salarioActual - salarioIncrement;
    empleadoListSink.add(_empleadoList);
  }

  // dispose
  void dispose(){
    _empleadoSalarioIncrementStreamController.close();
    _empleadoSalarioDecrementStreamController.close();
    _empleadoListStreamController.close();
  }
}