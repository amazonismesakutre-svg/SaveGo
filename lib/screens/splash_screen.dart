import 'package:flutter/material.dart';
import '../config/theme.dart';
import 'preview_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade, _scale;
  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
    _fade = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeIn));
    _scale = Tween(begin: 0.5, end: 1.0).animate(CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut));
    _ctrl.forward();
    Future.delayed(const Duration(seconds: 3), () { if (mounted) Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const PreviewScreen())); });
  }
  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: SaveGoTheme.primary,
      body: Center(child: FadeTransition(opacity: _fade, child: ScaleTransition(scale: _scale,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(width: 120, height: 120, decoration: BoxDecoration(gradient: const LinearGradient(colors: [SaveGoTheme.accent, SaveGoTheme.accentBlue]),
            borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: SaveGoTheme.accent.withOpacity(0.4), blurRadius: 30, spreadRadius: 5)]),
            child: const Center(child: Text('S', style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white)))),
          const SizedBox(height: 24),
          const Text('SaveGo', style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700, color: Colors.white)),
          const SizedBox(height: 8),
          Text('Life Management Platform', style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.6)))]))))); }
}
