import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      // currentState.usuario.copyWith().profesiones!.add(
      //     'Profesión ${currentState.usuario.copyWith().profesiones!.length + 1}');
      // final usuario = currentState.usuario.copyWith();
      final newProfesiones =[
        ...currentState.usuario.profesiones!,
        'Profesión ${currentState.usuario.profesiones!.length + 1}'
      ];
      final newUser = currentState.usuario.copyWith(profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario(){
    emit(UsuarioInitial());
  }
}
