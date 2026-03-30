import 'package:flutter/material.dart';
import '../config/theme.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pc = PageController();
  int _step = 0;
  String _name = '';
  int _age = 25;
  String _goal = '';
  bool _income = true;

  final List<String> _goals = [
    '💪 დისციპლინა',
    '💰 ფინანსები',
    '🧠 მენტალური',
    '📈 კარიერა',
    '🏋️ ფიტნესი',
    '📚 განათლება',
  ];

  void _next() {
    if (_step < 3) {
      setState(() {
        _step++;
      });
      _pc.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _finish() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => HomeScreen(name: _name.isEmpty ? 'User' : _name),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SaveGoTheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: List.generate(
                  4,
                  (i) => Expanded(
                    child: Container(
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: i <= _step
                            ? SaveGoTheme.accent
                            : Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pc,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildNamePage(),
                  _buildAgePage(),
                  _buildGoalPage(),
                  _buildIncomePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNamePage() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '👋 გამარჯობა!',
            style: TextStyle(fontSize: 36, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'როგორ გქვია?',
            style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.6)),
          ),
          const SizedBox(height: 40),
          TextField(
            onChanged: (v) => _name = v,
            style: const TextStyle(color: Colors.white, fontSize: 24),
            decoration: InputDecoration(
              hintText: 'სახელი',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: SaveGoTheme.accent, width: 2),
              ),
            ),
          ),
          const Spacer(),
          _buildButton('შემდეგი →', _next),
        ],
      ),
    );
  }

  Widget _buildAgePage() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'რამდენი წლის ხარ${_name.isNotEmpty ? ", $_name" : ""}?',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 60),
          Center(
            child: Text(
              '$_age',
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.w700,
                color: SaveGoTheme.accent,
              ),
            ),
          ),
          Slider(
            value: _age.toDouble(),
            min: 6,
            max: 70,
            activeColor: SaveGoTheme.accent,
            inactiveColor: Colors.white.withOpacity(0.1),
            onChanged: (v) => setState(() => _age = v.toInt()),
          ),
          const Spacer(),
          _buildButton('შემდეგი →', _next),
        ],
      ),
    );
  }

  Widget _buildGoalPage() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🎯 მთავარი მიზანი?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          ..._goals.map(
            (g) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GestureDetector(
                onTap: () => setState(() => _goal = g),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: _goal == g
                        ? SaveGoTheme.accent.withOpacity(0.15)
                        : Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _goal == g
                          ? SaveGoTheme.accent
                          : Colors.white.withOpacity(0.1),
                    ),
                  ),
                  child: Text(
                    g,
                    style: TextStyle(
                      fontSize: 17,
                      color: _goal == g
                          ? SaveGoTheme.accent
                          : Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          _buildButton('შემდეგი →', _next),
        ],
      ),
    );
  }

  Widget _buildIncomePage() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '💰 გაქვს შემოსავალი?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () => setState(() => _income = true),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _income
                    ? SaveGoTheme.accent.withOpacity(0.15)
                    : Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _income
                      ? SaveGoTheme.accent
                      : Colors.white.withOpacity(0.1),
                ),
              ),
              child: Text(
                '💼 დიახ, მაქვს',
                style: TextStyle(
                  fontSize: 18,
                  color: _income
                      ? SaveGoTheme.accent
                      : Colors.white.withOpacity(0.7),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => setState(() => _income = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: !_income
                    ? SaveGoTheme.accent.withOpacity(0.15)
                    : Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: !_income
                      ? SaveGoTheme.accent
                      : Colors.white.withOpacity(0.1),
                ),
              ),
              child: Text(
                '🎓 არა, სტუდენტი ვარ',
                style: TextStyle(
                  fontSize: 18,
                  color: !_income
                      ? SaveGoTheme.accent
                      : Colors.white.withOpacity(0.7),
                ),
              ),
            ),
          ),
          const Spacer(),
          _buildButton('დავიწყოთ! 🚀', _finish),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: SaveGoTheme.accent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
