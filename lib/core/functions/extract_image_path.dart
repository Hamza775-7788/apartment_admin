String extractImagePath({required String fullUrl, required String folder}) {
  try {
    // تحليل الرابط إلى مكوناته
    Uri uri = Uri.parse(fullUrl);

    // الحصول على أجزاء المسار
    List<String> pathSegments = uri.pathSegments;

    // البحث عن موقع الجزء الذي يبدأ بـ "proudct/"
    int startIndex = pathSegments.indexWhere((segment) => segment == folder);

    if (startIndex != -1) {
      // تجميع الأجزاء بدءاً من الموقع المطلوب
      List<String> desiredParts = pathSegments.sublist(startIndex);
      return desiredParts.join('/');
    }

    return '';
  } catch (e) {
    print('Error parsing URL: $e');
    return '';
  }
}
