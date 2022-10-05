import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsuarioService usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: !usuarioService.existeUsuario
            ? Text('Página 2')
            : Text(usuarioService.usuario.nombre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final user =
                    Usuario(nombre: 'Miguel Martínez', edad: 30, profesiones: [
                  'FullStack Developer',
                  'Tester Developer',
                ]);
                usuarioService.usuario = user;
              },
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              disabledColor: Colors.blueGrey,
              onPressed: !usuarioService.existeUsuario
                  ? null
                  : () => usuarioService.cambiarEdad(35),
              child: const Text('Cambiar edad',
                  style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              disabledColor: Colors.blueGrey,
              // onPressed: !usuarioService.existeUsuario ? null : () {
              //   usuarioService.agregarProfesion();
              // },
              onPressed: !usuarioService.existeUsuario
                  ? null
                  : usuarioService.agregarProfesion,
              child: const Text('Añadir profesión',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
