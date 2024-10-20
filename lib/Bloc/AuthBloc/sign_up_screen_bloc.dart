import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_cart/Models/AuthScreenModels/SignUpModel.dart';
import 'package:my_cart/Models/AuthScreenModels/login_model.dart';
import 'package:my_cart/Services/api_handler.dart';
import 'package:my_cart/Services/api_service.dart';

import '../../Services/api_exception.dart';

part 'sign_up_screen_event.dart';
part 'sign_up_screen_state.dart';

class SignUpScreenBloc extends Bloc<SignUpScreenEvent, SignUpScreenState> {
  final ApiHandler apiHandler;

  SignUpScreenBloc(this.apiHandler) : super(SignUpScreenInitialState()) {
    on<SignUpScreenEvent>((event, emit) async {
      if (event is SignUpEvent) {
        late SignUpModel signUpModel;
        try {
          emit(SignUpScreenLoadingState(true));
          signUpModel = await apiHandler.signUp(event.signUpBody);
          emit(SignUpScreenLoadingState(false));
          emit(SignUpEventState(signUpModel));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(SignUpScreenLoadingState(false));

          if (error is FetchDataException) {
            emit(APIFailureState(500, "${error.toString()}"));
          } else if (error is UnAuthorizedException) {
            emit(APIFailureState(401, "${error.toString()}"));
          } else if (error is DoesNotExistException) {
            emit(APIFailureState(404, "${error.toString()}"));
          } else if (error is ServerValidationError) {
            emit(APIFailureState(400, "${error.toString()}"));
          } else if (error is UnderMaintenanceError) { // Assuming you meant this one instead of repeating ServerValidationError
            emit(APIFailureState(503, "${error.toString()}"));
          } else {
            emit(APIFailureState(50000, "${error.toString()}")); // General fallback for other errors
          }
        }
      }

      if (event is LoginEvent) {
        late LoginModel loginModel;
        try {
          emit(SignUpScreenLoadingState(true));
          loginModel = await apiHandler.login(event.loginBody);
          emit(SignUpScreenLoadingState(false));
          emit(LoginEventState(loginModel));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(SignUpScreenLoadingState(false));

          if (error is FetchDataException) {
            emit(APIFailureState(500, "${error.toString()}"));
          } else if (error is UnAuthorizedException) {
            emit(APIFailureState(401, "${error.toString()}"));
          } else if (error is DoesNotExistException) {
            emit(APIFailureState(404, "${error.toString()}"));
          } else if (error is ServerValidationError) {
            emit(APIFailureState(400, "${error.toString()}"));
          } else if (error is UnderMaintenanceError) { // Assuming you meant this one instead of repeating ServerValidationError
            emit(APIFailureState(503, "${error.toString()}"));
          } else {
            emit(APIFailureState(50000, "${error.toString()}")); // General fallback for other errors
          }
        }
      }
    });
  }
}

