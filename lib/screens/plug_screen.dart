import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_plug/cubit/AppCubit/cubit.dart';
import 'package:smart_plug/cubit/AppCubit/states.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PlugScreen extends StatelessWidget {
  final String plugName;
  final String plugImage;
  const PlugScreen({Key? key, required this.plugName, required this.plugImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(plugName),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image(image: NetworkImage(plugImage)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(250, 240, 240, 240),
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Idle for:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "5 Min",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Last On:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "7:15 PM",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        AnimatedToggleSwitch.rolling(
                          current: cubit.value,
                          values: ['on', 'off'],
                          onChanged: (p0) => cubit.changeSwitch(p0),
                        ),
                        // ToggleSwitch(
                        //   totalSwitches: 2,
                        //   labels: ['on', "off"],
                        //   animate: true,
                        //   curve: Curves.linear,
                        // )
                      ],
                    ),
                  ),
                ))
              ]),
            ),
          );
        });
  }
}
