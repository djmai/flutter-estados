import 'dart:io';

import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/bloc/usuario/usuario_cubit.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final newUser = new Usuario(
                  nombre: 'Miguel Martínez',
                  edad: 30,
                  profesiones: ['FullStack Developer', 'Tester Develop'],
                );
                usuarioCubit.seleccionarUsuario(newUser);
              },
            ),
            MaterialButton(
              child:
                  Text('Cambiar edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.cambiarEdad(50);
              },
            ),
            MaterialButton(
              child: Text('Añadir profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
