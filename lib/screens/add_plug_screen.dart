// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_plug/cubit/AppCubit/cubit.dart';
import 'package:smart_plug/cubit/AppCubit/states.dart';
import 'package:smart_plug/screens/plug_adder_screen.dart';
import 'package:smart_plug/tools/constant.dart';
import 'package:smart_plug/tools/navigation.dart';

class AddPlugScreen extends StatelessWidget {
  const AddPlugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
          appBar: AppBar(
            backgroundColor: teal_color,
            title: Text("Available Devices"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      navigateTo(context, PlugAdderScreen());
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
                      child: Row(children: [
                        const Icon(
                          Icons.outlet,
                          size: 28,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Plug Id",
                          style: TextStyle(fontSize: 26),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
