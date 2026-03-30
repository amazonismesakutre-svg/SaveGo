import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../home_screen.dart';
import 'register_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _e = TextEditingController(), _p = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: SaveGoTheme.primary, body: SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.all(24), child: Column(children: [
      const SizedBox(height: 60), const Text('👋', style: TextStyle(fontSize: 48)), const SizedBox(height: 16),
      const Text('შესვლა', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white)), const SizedBox(height: 48),
      _f(_e, 'ელ-ფოსტა', Icons.email_outlined), const SizedBox(height: 16),
      _f(_p, 'პაროლი', Icons.lock_outline, o: true), const SizedBox(height: 32),
      SizedBox(width: double.infinity, height: 56, child: ElevatedButton(
        onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen(name: 'User'))),
        style: ElevatedButton.styleFrom(backgroundColor: SaveGoTheme.accent, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        child: const Text('შესვლა', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)))),
      const SizedBox(height: 24),
      TextButton(onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const RegisterScreen())),
        child: Text.rich(TextSpan(text: 'არ გაქვს? ', style: TextStyle(color: Colors.white.withOpacity(0.5)),
          children: const [TextSpan(text: 'რეგისტრაცია', style: TextStyle(color: SaveGoTheme.accent, fontWeight: FontWeight.w600))])))]))));
  }
  Widget _f(TextEditingController c, String h, IconData ic, {bool o = false}) => TextField(controller: c, obscureText: o,
    style: const TextStyle(color: Colors.white, fontSize: 16), decoration: InputDecoration(hintText: h,
      hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)), prefixIcon: Icon(ic, color: Colors.white.withOpacity(0.3)),
      filled: true, fillColor: Colors.white.withOpacity(0.08),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: SaveGoTheme.accent, width: 1.5))));
}
