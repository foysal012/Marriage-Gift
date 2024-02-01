import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:marriage_gift/model/contact_model_info.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:marriage_gift/screen/splash%20screen/splash_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    )
  );

  await Hive.initFlutter();
  var box = await Hive.openBox("man");

  Hive.registerAdapter(ContactModelInfoAdapter());
  var box2 = await Hive.openBox("gift");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      //home: HomePageScreen(),
      //home: AddNewUserInfo(),
      //home: SimpleTask(),
      home: SplashScreen(),
    );
  }
}
