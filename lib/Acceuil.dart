import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cv/youssef/provider/provider.dart';
import 'emna/constants/colors.dart';

class AccueilPage extends StatelessWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<YoussefUiProvider>(
      builder: (context, provider, _) => Scaffold(
        appBar: AppBar(
          title: Text('Accueil',style: TextStyle(
            color: provider.isDark ? Colors.white : Colors.black,
          ),),

          backgroundColor: provider.isDark ?  CustomColor.scaffoldBg : Colors.white,
        ),
        backgroundColor: provider.isDark ?  CustomColor.scaffoldBg : Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPersonTile(
                name: 'Youssef Koubaa',
                textColor: provider.isDark ? Colors.white : Colors.black, // Set text color based on dark mode
                imagePath: 'assets/youssef.png',
                onPressed: () {
                  Navigator.pushNamed(context, '/homepage');
                },
              ),
              SizedBox(height: 50),
              _buildPersonTile(
                name: 'Emna Kmmoun',
                textColor: provider.isDark ? Colors.white : Colors.black, // Set text color based on dark mode
                imagePath: 'assets/emna.jpg',
                onPressed: () {
                  Navigator.pushNamed(context, '/emna-homepage');
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            provider.toggleDarkMode();
          },
          child: Icon(
            provider.isDark ?  Icons.dark_mode:Icons.light_mode,
          ),
        ),
      ),
    );
  }

  Widget _buildPersonTile({
    required String name,
    required Color textColor, // Accept text color as a parameter
    required String imagePath,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              imagePath,
              width: 180,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor, // Use the provided text color
            ),
          ),
        ],
      ),
    );
  }
}
