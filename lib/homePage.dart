import 'package:flutter/material.dart';
//import 'empleado.dart';
import 'empleadoBloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmpleadoBlock _empleadoBlock = EmpleadoBlock();

  @override
  void dispose(){
    super.dispose();
    _empleadoBlock.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Empleado"),
      ),
      body: Container(
        
      ),
    );
  }
}