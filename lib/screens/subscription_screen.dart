import 'package:flutter/material.dart';
import '../config/theme.dart';
import 'auth/register_screen.dart';
import 'auth/login_screen.dart';
class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});
  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}
class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _s = 1;
  @override
  Widget build(BuildContext context) {
    final p = [
      {'n': 'BASIC', 'p': '9.99', 'i': '🌱', 'c': const Color(0xFF4CAF50), 's': 'საფუძველი'},
      {'n': 'PRO', 'p': '15', 'i': '⚡', 'c': const Color(0xFF2196F3), 's': 'სიღრმე'},
      {'n': 'ELITE', 'p': '21', 'i': '💎', 'c': SaveGoTheme.orange, 's': 'სრული ძალა'},
    ];
    return Scaffold(backgroundColor: SaveGoTheme.primary,
      body: SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.all(24), child: Column(children: [
        const SizedBox(height: 20),
        const Text('აირჩიე გეგმა', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white)),
        const SizedBox(height: 8),
        Text('7 დღე უფასოდ', style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.5))),
        const SizedBox(height: 32),
        ...List.generate(3, (i) => Padding(padding: const EdgeInsets.only(bottom: 16), child: GestureDetector(onTap: () => setState(() => _s = i),
          child: AnimatedContainer(duration: const Duration(milliseconds: 200), padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: _s == i ? (p[i]['c'] as Color).withOpacity(0.15) : Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20), border: Border.all(color: _s == i ? p[i]['c'] as Color : Colors.white.withOpacity(0.1), width: _s == i ? 2 : 1)),
            child: Row(children: [Text(p[i]['i'] as String, style: const TextStyle(fontSize: 28)), const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(p[i]['n'] as String, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: _s == i ? p[i]['c'] as Color : Colors.white)),
                Text(p[i]['s'] as String, style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.5)))])),
              Text('${p[i]['p']}₾', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: _s == i ? p[i]['c'] as Color : Colors.white))]))))),
        const SizedBox(height: 16),
        SizedBox(width: double.infinity, height: 56, child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const RegisterScreen())),
          style: ElevatedButton.styleFrom(backgroundColor: SaveGoTheme.accent, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
          child: const Text('დაიწყე 7 დღე უფასოდ 🚀', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)))),
        const SizedBox(height: 16),
        TextButton(onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen())),
          child: Text('უკვე გაქვს ანგარიში? შესვლა', style: TextStyle(color: Colors.white.withOpacity(0.5))))]))));
  }
}
