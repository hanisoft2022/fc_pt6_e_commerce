import 'package:intl/intl.dart';

extension NumX on num {
  /// 천 단위 콤마를 추가해서 문자열로 반환
  String get withComma {
    final formatter = NumberFormat('#,##0', 'ko_KR');
    return formatter.format(this);
  }

  /// 천 단위 콤마 처리 후 뒤에 '원'을 붙인 문자열 반환
  String get toWon {
    return '$withComma원';
  }

  // 9999로 제한, 초과 시 '9999+' 표시
  String get cappedAt9999 {
    const maxLimit = 9999;
    return this > maxLimit ? '${maxLimit.withComma}+' : withComma;
  }
}
