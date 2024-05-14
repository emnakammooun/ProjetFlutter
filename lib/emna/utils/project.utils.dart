class ProjectUtils {
  final String image;
  final Map<String, String> title;
  final Map<String, String> subtitle;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.webLink,
  });
}

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/cvke.jpg',
    title: {
      'en': 'Cv kammoun Emna',
      'fr': "Cv kammoun Emna",
      'ar': 'سيرة ذاتية كمون إمناء',
    },
    subtitle: {
      'en':
      "My digital resume highlights my skills, experiences and achievements in a professional and engaging way.",
      'fr':
      "Mon CV numérique met en lumière mes compétences, expériences et réalisations de manière professionnelle et attrayante.",
      'ar':
      'تسليط الضوء على مهاراتي وتجاربي وإنجازاتي الرقمية بطريقة احترافية وجذابة.',
    },
    webLink: 'https://github.com/emnakammooun/CV-K.Emna',
  ),
  ProjectUtils(
    image: 'assets/ecommerce.jpg',
    title: {
      'en': 'Ecommerce',
      'fr': "E commerce",
      'ar': 'التجارة الإلكترونية',
    },
    subtitle: {
      'en':
      "Ecommerce: Quickly order your favorite dishes in an instant!",
      'fr':
      "Ecommerce : Commandez rapidement vos plats préférés en un instant!",
      'ar':
      'التجارة الإلكترونية: اطلب سريعًا أطباقك المفضلة في لحظة!',
    },
    webLink: 'https://github.com/RafaelGoulartB/nodejs-ecommerce',
  ),
];
