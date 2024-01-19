import 'package:fast_app_base/common/dart/collection/sort_functions.dart';

class Animal {}

main() {
  /// 람다의 표현
  /// (int 파라미터1, String 파라미터2) => 반환값(return)
  // int add(int a, int b) {
  //   return a + b;
  // }

  int add(int a, int b) => a + b;

  final add2 = (int a, int b) => a + b;
  // byIntField((func) => null)
  /// 람다의 특징

  /// 1. 익명: 이름을 지을 수 없다. (변수에 담을 수 없음)
  /// 2. 함수: Class에 종속되지 않음
  /// 3. 전달: 1급 객체로써 함수 파라미터로 전달, 변수에 저장 가능
  /// 4. 간결성: 익명 클래스처럼 많은 코드를 구현할 필요가 없다.

  /// List Sort 예제

}
