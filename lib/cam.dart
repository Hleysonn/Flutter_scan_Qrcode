// ceci fonctionne avec Tflite mais il faut les données mobilnet.text et l'adapter en fonction du projet
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tflite/tflite.dart';

import 'main.dart';

class Cam extends StatefulWidget {
  const Cam({Key? key}) : super(key: key);

  @override
  State<Cam> createState() => _Cam();
}

class _Cam extends State<Cam> {

  bool isWorking =false;
  double? imgHeight;
  double? imgWidth;
  CameraController? cameraController;
  CameraImage? imgCamera;
  List? recognitionsList;

  initCamera()
  {
    cameraController =CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value)
    {
      if(!mounted)
      {
        return;
      }
      setState((){
        cameraController!.startImageStream((imageFromStream) =>
        {

          if(!isWorking)
            {
              isWorking= true,
              imgCamera =imageFromStream,
            }
        });
      });
    });
  }
  Future loadMoel()async
  {
    Tflite.close();
    try{
      String response;
      response = (await Tflite.loadModel(
          model: 'assets/ssd_mobilenet.tflite',
          labels: 'assets/ssd_mobilenet.txt'
      ))!;
      print(response);
    }
    on PlatformException
    {
      print('Unable to load Model ...');
    }
  }


  runModelOnStreamFrame()async{
    imgHeight =imgCamera!.height + 0.0;
    imgWidth = imgCamera!.width + 0.0;

    recognitionsList =await Tflite.detectObjectOnFrame(
      bytesList: imgCamera!.planes.map((plane)
      {
        return plane.bytes;
      }).toList(),

      model:'SSDMobileNet',
      imageHeight: imgCamera!.height,
      imageWidth: imgCamera!.width,

      imageMean: 127.5,
      imageStd: 127.5,

      numResultsPerClass: 1,

      threshold: 0.4,
    );

    isWorking = false;

    setState(() {
      imgCamera;
    });
  }

  Future loadModel() async
  {
    Tflite.close();

    try
    {
      String response;
      response = (await Tflite.loadModel(
          model: "assets/ssd_mobilenet.tflite",
          labels: "assets/ssd_mobilenet.txt"
      ))!;
      print(response);
    }
    on PlatformException
    {
      print("Unable to Load Model.");
    }
  }

  @override
  void dispose(){
    super.dispose();
    cameraController!.stopImageStream();
    Tflite.close();
  }

  @override
  void initState(){
    super.initState();
    loadMoel();
    initCamera();
  }

  List<Widget> displayBoxesAroundRecognozedObjects(Size screen)
  {
    if(recognitionsList == null) return [];

    if(imgHeight == null  ||  imgWidth == null) return [];

    double factorX = screen.width;
    double factorY = imgHeight!;

    Color colorPick = Colors.pink;

    return recognitionsList!.map((result)
    {
      return Positioned(
        left: result["rect"]["x"] * factorX,
        top: result["rect"]["y"] * factorY,
        width: result["rect"]["w"] * factorX,
        height: result["rect"]["h"] * factorY,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.pink, width: 2.0),
          ),
          child: Text(
            "${result['detectedClass']} ${(result['confidenceInClass'] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = colorPick,
              color: Colors.black,
              fontSize: 22.0,
            ),
          ),
        ),
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context)
  {
    Size size = MediaQuery.of(context).size;
    List<Widget> stackChildrenWidgets = [];

    stackChildrenWidgets.add(
      Positioned(
        top: 0.0,
        left: 0.0,
        width: size.width, height: size.height-100,
        child: Container(
          height: size.height-100,
          child: (!cameraController!.value.isInitialized)
              ? new Container()
              : AspectRatio(
            aspectRatio: cameraController!.value.aspectRatio,
            child: CameraPreview(cameraController!),
          ),
        ),
      ),
    );

    if(imgCamera != null)
    {
      stackChildrenWidgets.addAll(displayBoxesAroundRecognozedObjects(size));
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: const EdgeInsets.only(top: 50),
          color: Colors.black,
          child: Stack(
            children: stackChildrenWidgets,
          ),
        ),
      ),
    );
  }
}


// @override
//Widget build(BuildContext context)
//{
// return Container();
//}
//}
//}
