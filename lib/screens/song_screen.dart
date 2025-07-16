import 'dart:math';
import 'package:faber_ticket_tkptsl/screens/photo_screen.dart';
import 'package:faber_ticket_tkptsl/screens/custom_screen.dart';
import 'package:faber_ticket_tkptsl/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SongScreen extends StatefulWidget {
  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> with SingleTickerProviderStateMixin {
  int _currentIndex = 3;
  late AnimationController _eqController;

  final List<Map<String, String>> songs = [
    {
      'title': 'Best Part',
      'album': 'The Book of Us : Gravity',
      'cover': 'assets/images/cover_1.webp',
      'link': 'https://youtu.be/a-UfQfufkgU?si=f-Y4YeKPxz3DcH3F',
    },
    {
      'title': 'Better Better',
      'album': 'MOONRISE',
      'cover': 'assets/images/cover_2.webp',
      'link': 'https://youtu.be/7qkznpWePpY?si=uLTEa8pLwNL0yhMA',
    },
    {
      'title': 'Healer',
      'album': 'The Book of Us : Negentropy',
      'cover': 'assets/images/cover_3.webp',
      'link': 'https://youtu.be/HXEG0fqrViM?si=PY5WUHkY5mT9dqcd',
    },
    {
      'title': '한 페이지가 될 수 있게',
      'album': 'The Book of Us : Gravity',
      'cover': 'assets/images/cover_4.webp',
      'link': 'https://youtu.be/vnS_jn2uibs?si=YliqloRK12WZ2TI8',
    },
    {
      'title': '그녀가 웃었다',
      'album': 'Band Aid',
      'cover': 'assets/images/cover_5.webp',
      'link': 'https://youtu.be/09ig852MsMg?si=BcedZECKDmA--r1A',
    },
    {
      'title': 'How to love',
      'album': 'The Book of Us : Gravity',
      'cover': 'assets/images/cover_6.webp',
      'link': 'https://youtu.be/qCZm8abq8Co?si=X0FxVgmSdX6FRDZs',
    },
    {
      'title': '쏟아진다',
      'album': 'Every DAY6 November',
      'cover': 'assets/images/cover_7.webp',
      'link': 'https://youtu.be/IUGSKW12lHY?si=7OnG_f8a1uA8L5FW',
    },
    {
      'title': 'Say Wow',
      'album': 'Every DAY6 April',
      'cover': 'assets/images/cover_8.webp',
      'link': 'https://youtu.be/8meVwcHtoQk?si=367m1l71yl-pHc7G',
    },
    {
      'title': '예뻤어',
      'album': 'Every DAY6 February',
      'cover': 'assets/images/cover_9.webp',
      'link': 'https://youtu.be/BS7tz2rAOSA?si=VlL4d6vbNMfxsckJ',
    },
    {
      'title': 'I Loved You',
      'album': 'Every DAY6 September',
      'cover': 'assets/images/cover_10.webp',
      'link': 'https://youtu.be/EwLMA5XYnKI?si=mq92l0YXcGxyRCKM',
    },
    {
      'title': '놓아 놓아 놓아(Rebooted Ver.)',
      'album': 'SUNRISE',
      'cover': 'assets/images/cover_11.webp',
      'link': 'https://youtu.be/EErj6GjObew?si=kUBKP6xbkkJUyTyp',
    },
    {
      'title': 'Congratulations',
      'album': 'The Day',
      'cover': 'assets/images/cover_12.webp',
      'link': 'https://youtu.be/x3sFsHrUyLQ?si=TeUX-eDmwA4nc3jT',
    },
    {
      'title': '어떻게 말해',
      'album': 'Every DAY6 March',
      'cover': 'assets/images/cover_13.webp',
      'link': 'https://youtu.be/dwywhL1PenQ?si=hKei7L5tjC82mIym',
    },
    {
      'title': '아 왜(I Wait)',
      'album': 'Every DAY6 January',
      'cover': 'assets/images/cover_14.webp',
      'link': 'https://youtu.be/O3nFopIjmjI?si=HcEP9tc_KkSmUDnL',
    },
    {
      'title': 'Love me or Leave me',
      'album': 'The Book of Us : The Demon',
      'cover': 'assets/images/cover_15.webp',
      'link': 'https://youtu.be/LlFcvjDBSCU?si=DZtWQ4AXgxDgfqCY',
    },
    {
      'title': 'Shoot Me',
      'album': 'Shoot Me : Youth Part 1',
      'cover': 'assets/images/cover_16.webp',
      'link': 'https://youtu.be/g2X2LdJAIpU?si=eg5BzkO4Ny5Xdj7p',
    },
    {
      'title': '괴물',
      'album': 'Band Aid',
      'cover': 'assets/images/cover_17.webp',
      'link': 'https://youtu.be/QPsJrZGB_gc?si=2JzpeS7sxO9I0ig1',
    },
    {
      'title': 'Zombie',
      'album': 'The Book of Us : The Demon',
      'cover': 'assets/images/cover_18.webp',
      'link': 'https://youtu.be/k8gx-C7GCGU?si=LIo3wR3IrFOofJYZ',
    },
    {
      'title': '녹아내려요',
      'album': 'Band Aid',
      'cover': 'assets/images/cover_19.webp',
      'link': 'https://youtu.be/yss4rIrHl6o?si=Og2YWJXS1gW64Wq2',
    },
    {
      'title': 'HAPPY',
      'album': 'Fourever',
      'cover': 'assets/images/cover_20.webp',
      'link': 'https://youtu.be/2dFwndi4ung?si=qHm7I9H2iZP0UMm6',
    },
    {
      'title': '바래',
      'album': 'DAYDREAM',
      'cover': 'assets/images/cover_21.webp',
      'link': 'https://youtu.be/agNEwhiVj7Y?si=4d3Rp2UKL9i9mSfX',
    },
    {
      'title': '도와줘요 Rock&Roll',
      'album': 'Band Aid',
      'cover': 'assets/images/cover_22.webp',
      'link': 'https://youtu.be/LCpEVQ9yvVk?si=vkf_QKcvPDf6tWd7',
    },
    {
      'title': '망겜',
      'album': 'Band Aid',
      'cover': 'assets/images/cover_23.webp',
      'link': 'https://youtu.be/mqxDy2_GVLU?si=BkRmNspF4yj-Z-JY',
    },
    {
      'title': 'DANCE DANCE',
      'album': 'Every DAY6 May',
      'cover': 'assets/images/cover_24.webp',
      'link': 'https://youtu.be/NAW0idSQ6Zs?si=FghTVnopQ1cQspae',
    },
    {
      'title': 'Free하게',
      'album': 'The Day',
      'cover': 'assets/images/cover_25.webp',
      'link': 'https://youtu.be/SujoDZYCMCs?si=XVBGscEJQ3z9CFIX',
    },
    {
      'title': 'My Day',
      'album': 'Every DAY6 February',
      'cover': 'assets/images/cover_26.webp',
      'link': 'https://youtu.be/hA5v5zqKX3s?si=Sx_41E4TkheD6fGg',
    },
    {
      'title': 'First Time',
      'album': 'DAYDREAM',
      'cover': 'assets/images/cover_27.webp',
      'link': 'https://youtu.be/6bFj0cu4UJ8?si=2PXUoPDHh4pl-74A',
    },
    {
      'title': 'Welcome to the Show',
      'album': 'Fourever',
      'cover': 'assets/images/cover_28.webp',
      'link': 'https://youtu.be/RowlrvmyFEk?si=7IQyAJQeL8oL9acK',
    },
  ];

  @override
  void initState() {
    super.initState();
    _eqController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _eqController.dispose();
    super.dispose();
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void _onNavTap(int index) async {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    Widget? nextScreen;
    if (index == 0) {
      nextScreen = MainScreen();
    } else if (index == 1) {
      nextScreen = CustomScreen();
    } else if (index == 2) {
      nextScreen = PhotoScreen();
    } else if (index == 3) {
      nextScreen = SongScreen();
    }
    if (nextScreen != null) {
      // 애니메이션 방향 결정
      final isLeft = index < 3;
      await Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => nextScreen!,
          transitionsBuilder: (_, animation, __, child) {
            final begin = Offset(isLeft ? -1.0 : 1.0, 0.0);
            final end = Offset.zero;
            final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
            return SlideTransition(position: animation.drive(tween), child: child);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF5F5F5), Color(0xFFE0E0E0)],
                ),
              ),
            ),
          ),
          Positioned.fill(child: CustomPaint(painter: _NoisePainter())),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SETLIST",
                      style: TextStyle(
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF93BBDF),
                      ),
                    ),
                    SizedBox(width: 8),
                    AnimatedBuilder(
                      animation: _eqController,
                      builder: (_, __) {
                        return Row(
                          children: List.generate(3, (i) {
                            return Container(
                              width: 3,
                              height: 10 + 10 * sin(_eqController.value * pi * (i + 1)),
                              margin: EdgeInsets.symmetric(horizontal: 1),
                              decoration: BoxDecoration(
                                color: Color(0xFF93BBDF),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(left:20, right:20, top:10, bottom:100),
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      final song = songs[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            image: AssetImage(song['cover']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.black.withOpacity(0.3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      song['title']!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 1,
                                      margin: EdgeInsets.symmetric(vertical: 6),
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                    Text(
                                      song['album']!,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white.withOpacity(0.85),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _launchURL(song['link']!),
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  child: Icon(Icons.play_arrow, color: Colors.white, size: 28),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildMinimalIconButton(Icons.home, 0),
                    _buildMinimalIconButton(Icons.confirmation_number, 1),
                    _buildMinimalIconButton(Icons.camera_alt, 2),
                    _buildMinimalIconButton(Icons.music_note, 3),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMinimalIconButton(IconData icon, int index) {
    final bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => _onNavTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.lightBlue : Colors.black.withOpacity(0.3),
            size: MediaQuery.of(context).size.width * 0.075,
          ),
          SizedBox(height: 4),
          if (isSelected)
            Container(
              width: 14,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
        ],
      ),
    );
  }
}

class _NoisePainter extends CustomPainter {
  final Random _random = Random();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withOpacity(0.015)..blendMode = BlendMode.srcOver;
    for (int i = 0; i < 8000; i++) {
      final dx = _random.nextDouble() * size.width;
      final dy = _random.nextDouble() * size.height;
      canvas.drawCircle(Offset(dx, dy), 0.3, paint);
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
