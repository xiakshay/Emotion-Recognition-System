import 'package:flutter/material.dart';
import 'package:hers/screens/firstScreen.dart';
import 'package:camera/camera.dart';
import 'package:hers/themes/app_theme.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(
    home: const FirstScreen(),
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
  ));
}
