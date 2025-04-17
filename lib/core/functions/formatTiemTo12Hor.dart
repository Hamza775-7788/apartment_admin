String formatTime12Hour(
    {required DateTime dateTime, required String am, required String pm}) {
  // الحصول على الساعات والدقائق
  int hour = dateTime.hour;
  int minute = dateTime.minute;

  // تحديد ما إذا كانت AM أو PM
  String period = hour >= 12 ? pm : am;

  // تحويل الساعات إلى تنسيق 12 ساعة
  hour = hour % 12;
  hour = hour == 0 ? 12 : hour; // إذا كانت الساعة 0، إرجاع 12

  // تنسيق الوقت كـ "ساعة:دقيقة AM/PM"
  return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
}
