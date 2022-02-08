import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus/model/school_user.dart';
import 'package:school_bus/register.dart/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SchoolRegisterCubit extends Cubit<SchoolRegisterState> {
  SchoolRegisterCubit() : super(SchoolRegisterIntialState());

  static SchoolRegisterCubit get(context) =>
      BlocProvider.of(context, listen: false);

  void userRegister({
    @required String email,
    @required String password,
    @required String name,
    @required String phone,
  }) {
    print('dma');
    emit(SchoolRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user.email);
      print(value.user.uid);

      userCreate(name: name, email: email, phone: phone, uid: value.user.uid);
    }).catchError((error) {
      SchoolRegisterERRORState(error.toString());
    });
  }

  void userCreate({
    @required String email,
    @required String name,
    @required String phone,
    @required String uid,
  }) {
    SchoolUserModel model = SchoolUserModel(
        uid: uid,
        name: name,
        email: email,
        phone: phone,
        image:
            'https://imgupscaler.com/static/images/compare/animal-original.jpg');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(SchoolCreateSuccessState());
    }).catchError((error) {
      SchoolCreateERRORState(error.toString());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SchoolRegisterChangePasswordVisibiltyState());
  }
}
