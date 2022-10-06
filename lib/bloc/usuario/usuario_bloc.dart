import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:estados_app/models/usuario.dart';

part 'usuario_state.dart';

part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState()) {
    on<UsuarioEvent>((event, emit) => emit(usuarioEvent(event)));
  }

  UsuarioState usuarioEvent(UsuarioEvent event) {
    if (event is ActivarUsuario) {
      // return UsuarioState(user: event.usuario);
      return state.copyWith(usuario: event.usuario);
    } else if (event is CambiarEdad) {
      // return UsuarioState(user: state.usuario!.copyWith(edad: event.edad));
      return state.copyWith(usuario: state.usuario!.copyWith(edad: event.edad));
    } else if (event is AgregarProfesion) {
      // return UsuarioState(
      //   user: state.usuario?.copyWith(
      //     profesiones: [
      //       ...?state.usuario?.profesiones,
      //       event.profesion,
      //     ],
      //   ),
      // );

      return state.copyWith(
        usuario: state.usuario?.copyWith(
          profesiones: [
            ...?state.usuario?.profesiones,
            event.profesion,
          ],
        ),
      );
    } else if (event is BorrarUsuario) {
      // return UsuarioState();
      return state.borrarUsuario();
    } else {
      // return UsuarioState();
      return state.borrarUsuario();
    }
    // switch (event.runtimeType) {
    //   case ActivarUsuario:
    //     return UsuarioState(user: (event as UsuarioState).usuario);
    //   case CambiarEdad:
    //     return UsuarioState(
    //         user: state.usuario!
    //             .copyWith(edad: (event as UsuarioState).usuario!.edad));
    //   default:
    //     return UsuarioState();
    // }
    // return UsuarioState();
  }

  @override
  void onEvent(UsuarioEvent event) {
    super.onEvent(event);
    print('onEvent');
    print(event);
  }

  @override
  void onChange(Change<UsuarioState> change) {
    super.onChange(change);
    print('onChange');
    print(change);
  }

  @override
  void onTransition(Transition<UsuarioEvent, UsuarioState> transition) {
    super.onTransition(transition);
    print('onTransition');
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('onError');
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
