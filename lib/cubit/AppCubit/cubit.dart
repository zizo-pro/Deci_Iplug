import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_plug/cubit/AppCubit/states.dart';
import 'package:smart_plug/tools/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);
  dynamic value = 'on';
  dynamic plugAutovalue = 'on';

  TextEditingController plugNameController = TextEditingController();

  void submitPlug() {
    bool lol = true;
    if (plugAutovalue == "on") {
      lol = true;
    } else {
      lol = false;
    }
    Supabase.instance.client
        .from("plugs")
        .insert({'name':plugNameController.text,'uid': uid, 'auto_close': lol,'device_type':selecteditem,'image':'https://th.bing.com/th/id/OIP.obnB5MdliNLs-6O'})
        .then((value) {
          getPlugs();
        })
        .catchError((onError) {
          log(onError.toString());
        });
  }

  List<Map> itemWimage = [];
  List<DropdownMenuItem> items = [];
  var selecteditem = 'empt';

  void changeSelectedItem(value){
    selecteditem = value;

  }
  void getDevices(){
    items = [];
    items.add(DropdownMenuItem(child: Text("..."),value: "empt",));
    itemWimage = [];
    Supabase.instance.client.from('devices').select().then((value) {
      for (var i in value){
        items.add(DropdownMenuItem(child: Text(i['name']),value: i['name']));
        itemWimage.add({
          "name":i['name'],
          'image':i['image'],
        });
      }

    }).catchError((onError){
      log(onError.toString());
    });
  }

  void changeAutoSwitch(dynamic val) {
    plugAutovalue = val;
    emit(AppChangeSwitchState());
  }

  void changeSwitch(dynamic val) {
    value = val;
    emit(AppChangeSwitchState());
  }

  Widget rollPlug() {
    if (plugAutovalue == 'on') {
      return Icon(Icons.check);
    } else {
      return Icon(Icons.close);
    }
  }

  List<Map> plugs = [];
  void getPlugs(){
    Supabase.instance.client.from("plugs").select().then((value) {
      for (var i in value){
        plugs.add({
        'name': i['name'],
        'image':i['image']
      });
      emit(AppChangeSwitchState());}
    }).catchError((onError){log(onError.toString());});
  }
}
