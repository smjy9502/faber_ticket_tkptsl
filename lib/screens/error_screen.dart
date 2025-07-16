import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double verticalSpacing = MediaQuery.of(context).size.height * 0.03;

    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: verticalSpacing * 1.5),
              Center(
                child: Text(
                  "당신만의 faberite,\n다시 태그하면 바로 열립니다!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: verticalSpacing * 1.0),

              _buildFixedBoxWithImage(
                  Icons.nfc,
                  "NFC Tag 안내",
                  Colors.white,
                  'assets/images/error_01.webp'
              ),

              SizedBox(height: 8),

              // 🔥 2번 박스 : HOW TO MAKE (링크 연결)
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("네이버로 이동합니다."),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    await Future.delayed(Duration(seconds: 1));
                    _launchUrl("https://www.naver.com");
                  },
                  child: _buildHowToMakeBox(),
                ),
              ),

              SizedBox(height: 8),

              // 🔥 3번 Store
              Expanded(
                flex: 2,
                child: _buildFlexibleWideBox(
                  context,
                  Icons.store,
                  "Store",
                  Color(0xFF24FE41).withOpacity(0.8),
                  "https://m.smartstore.naver.com/faber_ite",
                  "Store 페이지로 이동합니다.",
                ),
              ),

              SizedBox(height: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Instagram : @faber.ite | X(twitter) : @faber_ite",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    "e-mail : faber_ite@naver.com",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: verticalSpacing * 1.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFixedBoxWithImage(IconData icon, String title, Color? color, String imagePath) {
    return Container(
      width: double.infinity,
      height: 240,
      margin: EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.black87),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHowToMakeBox() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFFDFC47).withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "HOW TO MAKE",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "MY FABERITE",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Icon(
            Icons.favorite,
            color: Colors.black87,
            size: 36,
          ),
        ],
      ),
    );
  }

  Widget _buildFlexibleWideBox(BuildContext context, IconData icon, String title, Color? color, String url, String message) {
    return GestureDetector(
      onTap: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: Duration(seconds: 1),
          ),
        );
        await Future.delayed(Duration(seconds: 1));
        _launchUrl(url);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: Colors.black87),
            SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
