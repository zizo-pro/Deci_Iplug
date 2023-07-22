import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_plug/cubit/AppCubit/cubit.dart';
import 'package:smart_plug/cubit/AppCubit/states.dart';
import 'package:smart_plug/tools/constant.dart';
import 'package:smart_plug/widgets/text_form_field.dart';

class PlugAdderScreen extends StatelessWidget {
  const PlugAdderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getDevices();
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(backgroundColor: teal_color,actions: [IconButton(onPressed: (){
            cubit.submitPlug(

            );
          }, icon: const Icon(Icons.check))],),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              DefaultTextFormField(controller: cubit.plugNameController, type: TextInputType.name, labelText: "Plug Name"),
              const SizedBox(height: 10,),

                Row(
                  children: [
                    Text("Select Device"),const SizedBox(width: 10,)
,                    Container(
                      width: 140,
                      child: DropdownButtonFormField(items: cubit.items, onChanged: (value){
                      cubit.changeSelectedItem(value);
                      },value: cubit.selecteditem,),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
              Row(
                children: [
                Text("Do Want it to turn off automatically"),
                const SizedBox(width: 10,),
                  AnimatedToggleSwitch.rolling(
                    iconBuilder: (value, size, foreground) => cubit.rollPlug(),
                    
                                indicatorColor: teal_color,
                                borderColor: teal_color,
                                current: cubit.plugAutovalue,
                                values: ['on', 'off'],
                                onChanged: (p0) => cubit.changeAutoSwitch(p0),
                              ),
                ],
              ),
              
            ],),
          ),
        );
      },
    );
  }
}