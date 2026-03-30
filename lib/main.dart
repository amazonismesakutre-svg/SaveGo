import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'config/theme.dart';
import 'screens/splash_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const SaveGoApp());
}
class SaveGoApp extends StatelessWidget {
  const SaveGoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'SaveGo', debugShowCheckedModeBanner: false, theme: SaveGoTheme.light, darkTheme: SaveGoTheme.dark, themeMode: ThemeMode.system, home: const SplashScreen());
  }
}
