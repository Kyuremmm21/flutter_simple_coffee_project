import 'dart:async';

import 'package:coffee_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Timer _navigationTimer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
    _navigationTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  void dispose() {
    _navigationTimer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fadeIn = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF3B2118), Color(0xFF1F120E)],
          ),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: -90,
              right: -70,
              child: _GlowCircle(size: 250),
            ),
            const Positioned(
              bottom: -120,
              left: -90,
              child: _GlowCircle(size: 300),
            ),
            SafeArea(
              child: Center(
                child: FadeTransition(
                  opacity: fadeIn,
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.88, end: 1).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeOutBack,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 116,
                          height: 116,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3E6D0),
                            borderRadius: BorderRadius.circular(36),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 28,
                                offset: const Offset(0, 14),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.coffee_rounded,
                            size: 62,
                            color: Color(0xFF6F4432),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'BREW & BEAN',
                          style: TextStyle(
                            color: Color(0xFFFFF8EE),
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 4,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'A little warmth in every cup.',
                          style: TextStyle(
                            color: Color(0xFFD8BCA7),
                            fontSize: 15,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 54),
                        const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFFE7B987),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'BREWING YOUR EXPERIENCE',
                          style: TextStyle(
                            color: Color(0xFFB99A84),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlowCircle extends StatelessWidget {
  const _GlowCircle({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF9A6041).withValues(alpha: 0.12),
        ),
      ),
    );
  }
}
