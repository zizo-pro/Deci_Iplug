import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_plug/cubit/loginCubit/loginCubit.dart';
import 'package:smart_plug/cubit/loginCubit/login_states.dart';
import 'package:smart_plug/widgets/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextFormField(
                    controller: cubit.emailController,
                    type: TextInputType.emailAddress,
                    labelText: "Email",
                    prefix: const Icon(Icons.email_outlined)),
                const SizedBox(
                  height: 15,
                ),
                DefaultTextFormField(
                    controller: cubit.passwordController,
                    type: TextInputType.visiblePassword,
                    labelText: "Password",
                    prefix: const Icon(Icons.password)),
                const SizedBox(height: 15),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("Login"),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        cubit.signUp(context: context);
                      },
                      child: Text("Register"),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
