/// String 확장 메서드
extension StringExtension on String {
  /// 빈 문자열 여부
  bool get isEmptyOrNull => trim().isEmpty;

  /// 유효한 문자열 여부
  bool get isNotEmptyOrNull => !isEmptyOrNull;

  /// 첫 글자 대문자
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// 이메일 형식 검증
  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// 전화번호 형식 검증 (한국)
  bool get isValidPhoneNumber {
    final phoneRegex = RegExp(r'^01[0-9]-?[0-9]{3,4}-?[0-9]{4}$');
    return phoneRegex.hasMatch(this);
  }
}

