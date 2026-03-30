import 'package:flutter/material.dart';
import '../config/theme.dart';
import 'subscription_screen.dart';
class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});
  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}
class _PreviewScreenState extends State<PreviewScreen> {
  final _pc = PageController();
  int _p = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [
      {'i': '🧬', 't': 'Life Score', 's': 'გაზომე ცხოვრების ხარისხი', 'c': SaveGoTheme.accent},
      {'i': '💪', 't': 'დისციპლინა', 's': 'Tasks + Streak + Level', 'c': const Color(0xFF6C63FF)},
      {'i': '🎁', 't': 'ფასდაკლებები', 's': '500+ ობიექტში 50%-მდე', 'c': SaveGoTheme.orange},
      {'i': '🤖', 't': 'AI Coach', 's': 'პერსონალური მენტორი', 'c': SaveGoTheme.accentBlue},
    ];
    return Scaffold(backgroundColor: SaveGoTheme.primary,
      body: SafeArea(child: Column(children: [
        Align(alignment: Alignment.topRight, child: Padding(padding: const EdgeInsets.all(16),
          child: TextButton(onPressed: _go, child: Text('გამოტოვება', style: TextStyle(color: Colors.white.withOpacity(0.5)))))),
        Expanded(child: PageView.builder(controller: _pc, onPageChanged: (i) => setState(() => _p = i), itemCount: 4,
          itemBuilder: (_, i) { final pg = pages[i]; return Padding(padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(width: 100, height: 100, decoration: BoxDecoration(color: (pg['c'] as Color).withOpacity(0.15), borderRadius: BorderRadius.circular(25)),
                child: Center(child: Text(pg['i'] as String, style: const TextStyle(fontSize: 48)))),
              const SizedBox(height: 32),
              Text(pg['t'] as String, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white)),
              const SizedBox(height: 12),
              Text(pg['s'] as String, style: TextStyle(fontSize: 18, color: pg['c'] as Color))])); })),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(4, (i) =>
          AnimatedContainer(duration: const Duration(milliseconds: 300), margin: const EdgeInsets.symmetric(horizontal: 4),
            width: _p == i ? 24 : 8, height: 8, decoration: BoxDecoration(color: _p == i ? SaveGoTheme.accent : Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(4))))),
        const SizedBox(height: 32),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 24), child: SizedBox(width: double.infinity, height: 56,
          child: ElevatedButton(onPressed: () { if (_p < 3) _pc.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut); else _go(); },
            style: ElevatedButton.styleFrom(backgroundColor: SaveGoTheme.accent, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
            child: Text(_p < 3 ? 'შემდეგი' : 'დაიწყე 🚀', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600))))),
        const SizedBox(height: 32)])));
  }
  void _go() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const SubscriptionScreen()));
}
