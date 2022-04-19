import 'package:academy_shell/pages/auth/services/auth_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    //registration
    on<RegistrationEvent>((event, emit) async {
      final jsonBody =
          await AuthServices().registerAUser(event.username, event.password);
      print(jsonBody);
    });
  }
}
