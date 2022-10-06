import 'dart:ffi';

import 'package:estados_app/bloc/usuario/usuario_cubit.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          BlocBuilder<UsuarioCubit, UsuarioState>(builder: (_, state) {
            if (state is UsuarioActivo) {
              return IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () => usuarioCubit.borrarUsuario(),);
            }
            return IconButton(onPressed: null, icon: Icon(Icons.exit_to_app));
          }),
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(child: Text('No hay información del usuario'));
            break;
          case UsuarioActivo:
            return InformacionUsuario(
                usuario: (state as UsuarioActivo).usuario);
            break;
          default:
            return Center(child: CircularProgressIndicator());
            break;
        }

        // if (state is UsuarioInitial) {
        //   return Center(child: Text('No hay información del usuario'));
        // } else if (state is UsuarioActivo) {
        //   return InformacionUsuario(usuario: state.usuario);
        // } else {
        //   return Center(child: CircularProgressIndicator());
        // }
      },
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
          ...usuario.profesiones!
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList()
        ],
      ),
    );
  }
}
