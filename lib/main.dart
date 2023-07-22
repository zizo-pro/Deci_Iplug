import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_plug/cubit/AppCubit/cubit.dart';
import 'package:smart_plug/cubit/loginCubit/loginCubit.dart';
import 'package:smart_plug/screens/home_screen.dart';
import 'package:smart_plug/screens/login_screen.dart';
import 'package:smart_plug/tools/constant.dart';
import 'package:smart_plug/tools/shared_prefrences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// 0cNgijiRYcKgpAr8 supabase database password

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://cbqrjxytdxbonwiofcrf.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNicXJqeHl0ZHhib253aW9mY3JmIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTAwMTk4MjUsImV4cCI6MjAwNTU5NTgyNX0.Z9eo_7O3k5fD-NMzlgsrd-POpqUBIQvyals-sWf99Ow');
  await CacheHelper.init();
  uid = await CacheHelper.getData(key: 'uid');

  var startWidget;
  if (uid == null) {
    startWidget = LoginScreen();
  } else {
    startWidget = HomeScreen();
  }
  runApp(MyApp(startWidget: startWidget));
}

class MyApp extends StatelessWidget {
  Widget startWidget;
  MyApp({super.key,required this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..getPlugs(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: MaterialApp(
        // Application name
        title: 'Flutter Hello World',
        // Application theme data, you can set the colors for the application as
        // you want
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // A widget which will be started on application startup
        home: startWidget,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: const Text("My Smart Plugs"),
      ),
      body: Center(
        child: Text(
          'Hello, World!',
        ),
      ),
    );
  }
}
