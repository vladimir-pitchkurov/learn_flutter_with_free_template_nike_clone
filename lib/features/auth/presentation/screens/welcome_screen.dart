import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // 1. НАШЕ СОСТОЯНИЕ
  // Здесь будет жить логика анимаций, например:
  // bool _isAnimated = false;

  // 2. onMounted / created
  @override
  void initState() {
    super.initState();
    // Это аналог `onMounted` в Vue.
    // Идеальное место, чтобы запустить наши анимации
    // (например, с небольшой задержкой).
  }

  // 3. <template> / render
  @override
  Widget build(BuildContext context) {
    const String backgroundImage = 'assets/images/welcome_background.png';
    const String overlayImage = 'assets/images/welcome_overlay.png';
    const String logoPath = 'assets/images/nike_logo.svg';

    return Scaffold(
      body: Stack(
        children: [
          // СЛОЙ 1: Фон (внизу)
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(backgroundImage, fit: BoxFit.cover),
          ),

          // СЛОЙ 2: Оверлей (поверх фона)
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(overlayImage, fit: BoxFit.cover),
          ),

          // СЛОЙ 3: КОНТЕНТ (на самом верху)
          // Мы убрали Positioned.
          // Этот Column теперь сам является 3-м слоем.
          Column(
            children: [
              // 1. Сначала идет Spacer, он "толкает" все вниз.
              const Spacer(),

              // 2. А вот наш контент-блок
              Container(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Логотип
                    SvgPicture.asset(
                      logoPath,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      width: 50,
                    ),
                    const SizedBox(height: 24),
                    // Текст
                    const Text(
                      'Nike App',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Bringing Nike Members the best products, inspiration and stories in sport.',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),

                    // 3. Отступ ПЕРЕД кнопками.
                    // Мы не можем использовать Spacer здесь, так как Column
                    // внутри Container тоже не имеет высоты.
                    // Вместо этого просто дадим большой отступ.
                    const SizedBox(height: 48),

                    // 4. КНОПКИ
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            // Твои CSS-свойства здесь:
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape:
                                const StadiumBorder(), // Это дает "pill-shaped" (форму таблетки)
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 40,
                            ), // Паддинг по вертикали
                          ),
                          child: const Text('Join Us'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Sign In'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
