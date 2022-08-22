import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cam.dart';
import 'home.dart';

const d_Red = Color(0xFFe9717D);
const d_blue = Color(0xFF035959);

List<CameraDescription>? cameras;
Future<void> main()async{

  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test objet',
      color: d_blue,
      /*theme: ThemeData(

        //primarySwatch: Colors.blue,
      ),*/
      home: WelcomPage(),
    );
  }
}

