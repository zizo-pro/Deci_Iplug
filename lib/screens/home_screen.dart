import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_plug/cubit/AppCubit/cubit.dart';
import 'package:smart_plug/cubit/AppCubit/states.dart';
import 'package:smart_plug/screens/add_plug_screen.dart';
import 'package:smart_plug/tools/navigation.dart';
import 'package:smart_plug/widgets/smart_plug_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const List<Widget> plugs = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {
        
      },
      builder:(context, state) {var cubit= AppCubit.get(context);
      return Scaffold(
        appBar: AppBar(title: Text("My Smart Plugs"),actions: [IconButton(onPressed: (){
          navigateTo(context, AddPlugScreen());
        }, icon: Icon(Icons.add))],backgroundColor: Color.fromARGB(255, 141,217,191),),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 15,
                  children: 
                  List.generate(cubit.plugs.length, (index) => SmartPlugItem(context: context, plugName: cubit.plugs[index]['name'], plugImage: cubit.plugs[index]['image']))
                  
                  
                  
                  // [
                  //   SmartPlugItem(
                  //       context: context,
                  //       plugName: 'Microwave',
                  //       plugImage:
                  //           'https://3c1703fe8d.site.internapcdn.net/newman/gfx/news/hires/2018/microwaves.jpg'),
                  //   SmartPlugItem(
                  //       context: context,
                  //       plugName: 'Tv',
                  //       plugImage:
                  //           'https://i5.walmartimages.com/asr/3e94a10b-b889-4ecc-9d2c-ace12aa95341_3.997ddf1d59b9786ad1f38ccc1e1f5b4e.jpeg'),
                  //   SmartPlugItem(
                  //       context: context,
                  //       plugName: 'Blender',
                  //       plugImage:
                  //           'https://th.bing.com/th/id/R.293e082bacd64b03f5a2bd97509fafc4?rik=r2cnn%2fPNOBq6FQ&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f6%2fBlender-Background-PNG.png&ehk=mPa6cUvPD%2bPzzySth%2bE6723GSmXvI%2f33RfGzh%2fgByN0%3d&risl=&pid=ImgRaw&r=0'),
                  //   SmartPlugItem(
                  //       context: context,
                  //       plugName: 'Charger',
                  //       plugImage:
                  //           'https://th.bing.com/th/id/OIP.YugiX-JF7Q0s0TfjmOcCmQHaHa?w=189&h=188&c=7&r=0&o=5&pid=1.7'),
                  // ]
                  ),
            ]),
          ),
        ),
      );}
    );
  }
}
