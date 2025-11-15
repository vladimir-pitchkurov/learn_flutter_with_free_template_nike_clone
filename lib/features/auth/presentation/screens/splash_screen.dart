import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // 1. Импортируем пакет

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String logoPath = 'assets/images/nike_logo.svg';

    return Scaffold(
      body: Center(
        // 3. Заменяем Text на SvgPicture.asset
        child: SvgPicture.asset(
          logoPath,
          // 4. Давай сразу зададим ему цвет, 
          // так как лого в Figma белое
          colorFilter: const ColorFilter.mode(
            Colors.white, 
            BlendMode.srcIn,
          ),
          width: 100, // Можешь поиграть с размером
        ),
      ),
    );
  }
}