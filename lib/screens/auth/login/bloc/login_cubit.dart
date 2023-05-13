import 'package:doctor_application/common/pref_manager.dart';
import 'package:doctor_application/layout/doctor_screen.dart';
import 'package:doctor_application/models/login_model.dart';
import 'package:doctor_application/screens/auth/login/bloc/login_state.dart';
import 'package:doctor_application/screens/auth/login/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  // GlobalKey<FormState> formKey =
  //     GlobalKey<FormState>(debugLabel: 'GlobalFormKey #SignIn ');
  static LoginCubit get(context) => BlocProvider.of(context);

  login(context) async {
    // if (!formKey.currentState!.validate()) return;
    try {
      emit(LoginLoading());
      LoginModel response = await LoginRepository()
          .loginRequest(password: password.text, username: username.text);
      if (response.status == 'success') {
        PreferenceManager.getInstance()!.saveString('token', response.token!);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LayoutScreen()));
        emit(LoginLoaded(loginModel: response));
      } else {
        Fluttertoast.showToast(
          msg: "${response.status}",
        );
        emit(LoginErrorState());
      }
    } catch (e) {
      emit(LoginErrorState(message: '$e'));
    }
  }
}
