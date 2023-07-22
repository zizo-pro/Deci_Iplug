import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_plug/cubit/loginCubit/login_states.dart';
import 'package:smart_plug/screens/home_screen.dart';
import 'package:smart_plug/tools/constant.dart';
import 'package:smart_plug/tools/navigation.dart';
import 'package:smart_plug/tools/shared_prefrences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var supabase = Supabase.instance.client;

  void login({required context}) {
    supabase.auth
        .signInWithPassword(
            password: passwordController.text, email: emailController.text)
        .then((value) {
      CacheHelper.saveData(key: 'uid', value: value.user!.id);
      uid = value.user!.id;
      navigateAndFinish(context, HomeScreen());
    }).catchError((error) {
      log(error.toString());
    });
  }

  void signUp({required context}) {
    supabase.auth
        .signUp(password: passwordController.text, email: emailController.text)
        .then((value) {
      createUser(
          id: value.user!.id, email: value.user!.email, context: context);
      CacheHelper.saveData(key: 'uid', value: value.user!.id);
      uid = value.user!.id;
    }).catchError((error) {
      log(error.toString());
    });
  }

  void createUser({required id, required email, required context}) {
    supabase.from('users').insert({'id': id, 'email': email}).then((value) {
      navigateAndFinish(context, HomeScreen());
    }).catchError((onError) {
      log(onError.toString());
    });
  }
}
