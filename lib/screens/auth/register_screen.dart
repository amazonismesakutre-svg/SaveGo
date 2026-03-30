import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../onboarding_screen.dart';
import 'login_screen.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final _e = TextEditingController(), _p = TextEditingController(), _c = TextEditingController();
  String? _err;
  void _reg() {
    if (_p.text != _c.text) { setState(() => _err = 'პაროლები არ ემთხვევა'); return; }
    if (_p.text.length < 6) { setState(() => _err = 'მინიმუმ 6 სიმბოლო'); return; }
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const OnboardingScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: SaveGoTheme.primary, body: SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.all(24), child: Column(children: [
      const SizedBox(height: 60), const Text('🚀', style: TextStyle(fontSize: 48)), const SizedBox(height: 16),
      const Text('რეგისტრაცია', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white)), const SizedBox(height: 48),
      _f(_e, 'ელ-ფოსტა', Icons.email_outlined), const SizedBox(height: 16),
      _f(_p, 'პაროლი', Icons.lock_outline, o: true), const SizedBox(height: 16),
      _f(_c, 'გაიმეორე პაროლი', Icons.lock_outline, o: true),
      if (_err != null) Padding(padding: const EdgeInsets.only(top: 16), child: Container(padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: SaveGoTheme.red.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
        child: Text(_err!, style: const TextStyle(color: SaveGoTheme.red)))),
      const SizedBox(height: 32),
      SizedBox(width: double.infinity, height: 56, child: ElevatedButton(onPressed: _reg,
        style: ElevatedButton.styleFrom(backgroundColor: SaveGoTheme.accent, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        child: const Text('გაგრძელება →', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)))),
      const SizedBox(height: 24),
      TextButton(onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen())),
        child: Text.rich(TextSpan(text: 'უკვე გაქვს? ', style: TextStyle(color: Colors.white.withOpacity(0.5)),
          children: const [TextSpan(text: 'შესვლა', style: TextStyle(color: SaveGoTheme.accent, fontWeight: FontWeight.w600))])))]))));
  }
  Widget _f(TextEditingController c, String h, IconData ic, {bool o = false}) => TextField(controller: c, obscureText: o,
    style: const TextStyle(color: Colors.white, fontSize: 16), decoration: InputDecoration(hintText: h,
      hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)), prefixIcon: Icon(ic, color: Colors.white.withOpacity(0.3)),
      filled: true, fillColor: Colors.white.withOpacity(0.08),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: SaveGoTheme.accent, width: 1.5))));
}
