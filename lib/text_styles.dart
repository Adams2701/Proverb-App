part of theme;

/// displayText uses weight - 700, while headingText uses weight - 500. Both have sizes 20, 18, 16
/// all bodyText uses size - 16, varying weights
class _AppTextStyles {
  /// size: 16, weight: 400
  static const bodyRegular = TextStyle(
    fontSize: 16,
    fontFamily: AppFont.dmSansRegular,
    color: _Colors.black,
  );

  /// size: 16, weight: 500
  static const bodySmall = TextStyle(
    fontSize: 14,
    fontFamily: AppFont.dmSansRegular,
    color: _Colors.black,
  );

  /// size: 16, weight: 700
  static const bodyBold = TextStyle(
    fontSize: 16,
    fontFamily: AppFont.dmSansBold,
    color: _Colors.black,
  );

  /// size: 16, weight: 400, color: greyLight
  static const bodyCaption = TextStyle(
    fontSize: 16,
    fontFamily: AppFont.dmSansRegular,
    color: _Colors.greyLighter,
  );

  /// size: 12, weight: 400
  static const textFieldCaption = TextStyle(
    fontSize: 12,
    fontFamily: AppFont.dmSansRegular,
    color: _Colors.greyLighter,
  );

  static const textFieldBody = TextStyle(
    fontSize: 16,
    fontFamily: AppFont.dmSansRegular,
    color: _Colors.greyDarker,
  );

  static const buttonText = TextStyle(
    fontSize: 14,
    fontFamily: AppFont.dmSansBold,
    color: _Colors.buttextColor,
  );

  static const textButtonText = TextStyle(
    fontSize: 14,
    fontFamily: AppFont.dmSansMedium,
  );

  static const displayLarge = TextStyle(
    fontSize: 20,
    fontFamily: AppFont.dmSansBold,
    color: _Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const displayMedium = TextStyle(
    fontSize: 18,
    fontFamily: AppFont.dmSansBold,
    color: _Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const displaySmall = TextStyle(
    fontSize: 16,
    fontFamily: AppFont.dmSansBold,
    color: _Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const headingLarge = TextStyle(
    fontSize: 20,
    fontFamily: AppFont.dmSansMedium,
    color: _Colors.black,
  );

  static const headingMedium = TextStyle(
    fontSize: 18,
    fontFamily: AppFont.dmSansMedium,
    color: _Colors.black,
  );

  static const headingSmall = TextStyle(
    fontSize: 16,
    fontFamily: AppFont.dmSansMedium,
    color: _Colors.black,
  );
}
