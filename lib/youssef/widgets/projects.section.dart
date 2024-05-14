import 'package:flutter/material.dart';
import 'package:cv/youssef/widgets/project.card.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../utils/project.utils.dart';
import '../provider/provider.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<YoussefUiProvider>(
      builder: (context, YoussefUiProvider uiProvider, child) {
        final backgroundColor = uiProvider.isDark ? CustomColor.scaffoldBg : Colors.white;
        final textColor = uiProvider.isDark ? Colors.white : Colors.black;
        final currentLanguage = uiProvider.locale.languageCode;

        return Container(
          width: screenWidth,
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
          color: backgroundColor, // Set background color
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Academic projects title
              Text(
                currentLanguage == 'en' ? "Academic Projects" : "مشاريع أكاديمية",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor, // Set text color
                ),
              ),

              const SizedBox(height: 50),
              // Academic project cards
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Wrap(
                  spacing: 25,
                  runSpacing: 25,
                  children: [
                    for (int i = 0; i < workProjectUtils.length; i++)
                      ProjectCardWidget(
                        project: workProjectUtils[i],
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
