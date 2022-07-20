import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'package:hers/main.dart';

class HandGesture extends StatefulWidget {
  const HandGesture({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HandGesture> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String answer = '';

  loadModel() async {
    Tflite.loadModel(
      model: 'assets/model/handGesture.tflite',
      labels: 'assets/model/Handlabels.txt',
    );
  }

  initCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((image) {
            cameraImage = image;
            applyModelonimages();
          });
        });
      }
    });
  }

  applyModelonimages() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 3,
          threshold: 0.1,
          asynch: true);

      answer = '';

      predictions!.forEach((prediction) {
        answer += prediction['label'].toString().substring(0, 1).toUpperCase() +
            prediction['label'].toString().substring(1) +
            " " +
            (prediction['confidence'] as double).toStringAsFixed(3) +
            '\n';
      });
      setState(() {
        answer = answer;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initCamera();
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: cameraImage != null
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Stack(children: [
                  Positioned(
                    child: Center(
                        child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: AspectRatio(
                          aspectRatio: cameraController!.value.aspectRatio,
                          child: CameraPreview(
                            cameraController!,
                          )),
                    )),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.black87,
                        child: Center(
                          child: Text(
                            answer,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              )
            : Container(),
      )),
    );
  }
}
