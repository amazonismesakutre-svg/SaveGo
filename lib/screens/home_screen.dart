import 'package:flutter/material.dart';
import '../config/theme.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  const HomeScreen({super.key, required this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tab = 0;
  int score = 45;
  int streak = 3;
  int xp = 0;

  final List<Map<String, dynamic>> tasks = [
    {'t': '⏰ გაღვიძება 7:30', 'xp': 5, 'd': false},
    {'t': '🧘 მედიტაცია 5წთ', 'xp': 3, 'd': false},
    {'t': '💪 ვარჯიში 15წთ', 'xp': 5, 'd': false},
    {'t': '💰 ხარჯის ჩანოტვა', 'xp': 3, 'd': false},
    {'t': '📖 წაკითხვა 15წთ', 'xp': 4, 'd': false},
    {'t': '📝 ჟურნალი', 'xp': 3, 'd': false},
    {'t': '💧 6 ჭიქა წყალი', 'xp': 3, 'd': false},
  ];

  String get levelIcon {
    if (score >= 96) return '💎';
    if (score >= 81) return '👑';
    if (score >= 61) return '⚔️';
    if (score >= 41) return '⚡';
    if (score >= 21) return '🌿';
    return '🌱';
  }

  String get levelName {
    if (score >= 96) return 'Legend';
    if (score >= 81) return 'Master';
    if (score >= 61) return 'Warrior';
    if (score >= 41) return 'Achiever';
    if (score >= 21) return 'Explorer';
    return 'Starter';
  }

  void _toggleTask(int i) {
    setState(() {
      tasks[i]['d'] = !tasks[i]['d'];
      if (tasks[i]['d']) {
        xp += tasks[i]['xp'] as int;
        score = (score + 2).clamp(0, 100);
      } else {
        xp -= tasks[i]['xp'] as int;
        score = (score - 2).clamp(0, 100);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final fg = dark ? Colors.white : SaveGoTheme.textDark;
    final bg = dark ? Colors.white.withOpacity(0.05) : Colors.white;
    final done = tasks.where((t) => t['d'] == true).length;

    return Scaffold(
      backgroundColor: dark ? SaveGoTheme.darkBg : SaveGoTheme.lightBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'გამარჯობა, ${widget.name} 👋',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: fg),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'დღეს უკეთესი იყო ვიდრე გუშინ',
                        style:
                            TextStyle(fontSize: 14, color: fg.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [SaveGoTheme.accent, SaveGoTheme.accentBlue]),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        widget.name.isNotEmpty
                            ? widget.name[0].toUpperCase()
                            : 'S',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [SaveGoTheme.primary, Color(0xFF16213E)]),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                        color: SaveGoTheme.primary.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10))
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('🧬 Life Score',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 14)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                              color: SaveGoTheme.accent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text('$levelIcon $levelName',
                              style: const TextStyle(
                                  color: SaveGoTheme.accent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text('$score',
                        style: const TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _stat('🔥', '$streak დღე', 'Streak'),
                        _stat('⚡', '$xp', 'XP'),
                        _stat('✅', '$done/${tasks.length}', 'Tasks'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(16),
                  border:
                      Border.all(color: SaveGoTheme.accent.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    const Text('🔓', style: TextStyle(fontSize: 24)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('შემდეგი: ☕ კაფეები',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: fg)),
                          Text('Score 21+ საჭირო',
                              style: TextStyle(
                                  fontSize: 13, color: fg.withOpacity(0.5))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text('📋 დღევანდელი Tasks',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700, color: fg)),
              const SizedBox(height: 12),
              ...List.generate(
                  tasks.length,
                  (i) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: GestureDetector(
                          onTap: () => _toggleTask(i),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: tasks[i]['d']
                                  ? SaveGoTheme.accent.withOpacity(0.1)
                                  : bg,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                  color: tasks[i]['d']
                                      ? SaveGoTheme.accent.withOpacity(0.3)
                                      : Colors.grey.withOpacity(0.15)),
                            ),
                            child: Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: tasks[i]['d']
                                        ? SaveGoTheme.accent
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: tasks[i]['d']
                                            ? SaveGoTheme.accent
                                            : Colors.grey.withOpacity(0.3),
                                        width: 2),
                                  ),
                                  child: tasks[i]['d']
                                      ? const Icon(Icons.check,
                                          size: 18, color: Colors.white)
                                      : null,
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Text(
                                    tasks[i]['t'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: tasks[i]['d']
                                          ? fg.withOpacity(0.5)
                                          : fg,
                                      decoration: tasks[i]['d']
                                          ? TextDecoration.lineThrough
                                          : null,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                      color:
                                          SaveGoTheme.accent.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Text('+${tasks[i]['xp']}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: SaveGoTheme.accent)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: dark ? SaveGoTheme.primary : Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -5))
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _nav(0, '🏠', 'Home'),
                _nav(1, '📊', 'Stats'),
                _nav(2, '🎁', 'Rewards'),
                _nav(3, '🧩', 'Quiz'),
                _nav(4, '🤖', 'AI'),
                _nav(5, '👤', 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _stat(String emoji, String value, String label) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700)),
        Text(label,
            style: const TextStyle(color: Colors.white38, fontSize: 11)),
      ],
    );
  }

  Widget _nav(int i, String emoji, String label) {
    return GestureDetector(
      onTap: () => setState(() => _tab = i),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: TextStyle(fontSize: _tab == i ? 24 : 20)),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: _tab == i ? FontWeight.w600 : FontWeight.normal,
              color: _tab == i ? SaveGoTheme.accent : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
