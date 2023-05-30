class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'اسهل وأرخص',
      image: 'images/onboarding_image_1.svg',
      discription: 'أستعرض العديد من المنتجات المميزة'
          'بسهولة وتمتع بالكثير من العروض'
          'والغصومات الخاصة'
  ),
  UnbordingContent(
      title: 'توصيل الى المنزل',
      image: 'images/onboarding_image_2.svg',
      discription: 'استمتع بخدمات التوصيل حيث تستطيع'
          'الطلب ونحن نقوم بتوصيل كاقة المنتجات بسرعة وأمانة'
  ),
  UnbordingContent(
      title: 'اذن الوصول',
      image: 'images/onboarding_image_3.svg',
      discription: 'يحتاج التطبيق الى صلاحية الوصول الى'
          'موقعك من أجل خدمات التوصيل'
  ),
  UnbordingContent(
      title: 'السماح للاشعارات',
      image: 'images/onboarding_image_4.svg',
      discription: 'نحن نرسل لك اشعارات دورية بكل'
          'التحديثات ضمن التطبيق'
  ),
];