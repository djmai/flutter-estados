import 'dart:ffi';

import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            // if (snapshot.hasData) {
            //   return usuarioService.existeUsuario
            //       ? InformacionUsuario(usuario: usuarioService.usuario)
            //       : Center(
            //           child: Text('No hay información del usuario'),
            //         );
            // } else if (snapshot.hasError) {
            //   return Icon(Icons.error_outline);
            // } else {
            //   return CircularProgressIndicator();
            // }

            return snapshot.hasData
                ? InformacionUsuario(usuario: usuarioService.usuario)
                : Center(
                    child: Text('No hay información del usuario'),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Profersion 1')),
          ListTile(title: Text('Profersion 1')),
          ListTile(title: Text('Profersion 1')),
        ],
      ),
    );
  }
}
