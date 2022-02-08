import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus/school_bus/cubit/schoollogin_state.dart';

class SchoolLoginCubit extends Cubit<SchoolLoginState> {
  SchoolLoginCubit() : super(SchoolLoginIntialState());

  static SchoolLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    @required String email,
    @required String password,
  }) {
    emit(SchoolLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user.email);
      print(value.user.uid);

      String uId;
      emit(SchoolLoginSuccessState(uId));
    }).catchError((error) {
      SchoolLoginERRORState(error.toString());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SchoolChangePasswordVisibiltyState());
  }
}
