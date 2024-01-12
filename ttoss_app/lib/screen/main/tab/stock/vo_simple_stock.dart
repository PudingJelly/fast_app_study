class SimpleStock {
  final String stockName;

  SimpleStock(this.stockName);

  /// factory : 생성자와 비슷한 기능을 함
  /// 가공할 수 있는 다른 파라미터를 가지고 필요한 생성자를 호출하여
  /// 그 객체를 돌려주는 역할을 함
  factory SimpleStock.fromJson(dynamic json) {
    return SimpleStock(json["name"]);
  }
}