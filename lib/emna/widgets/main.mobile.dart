import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Consumer<EmnaUiProvider>(
      builder: (context, EmnaUiProvider notifier, _) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
          height: screenHeight,
          constraints: const BoxConstraints(minHeight: 500),
          color: notifier.isDark ? CustomColor.scaffoldBg : Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.5,
                backgroundImage: AssetImage('assets/emna.jpg'),
              ),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  final textColor = notifier.isDark ? Colors.white : Colors.black;
                  return Text(
                    notifier.isEnglish
                        ? "Emna Kammoun\nComputer Engineering Student"
                        : "إمناء كمون\nطالبة هندسة الحاسوب",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      height: 2,
                      fontWeight: FontWeight.normal,
                      color: textColor,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => _launchMapsURL('34.7981109,10.7757774'),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5),
                    Text(
                      notifier.isEnglish
                          ? 'Route mahdia sakkiet eddaire,sfax,tunis'
                          : 'طريق المهدية ساقية الدائر، صفاقس، تونس',                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

void _launchMapsURL(String coordinates) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=${Uri.encodeFull(coordinates)}';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
