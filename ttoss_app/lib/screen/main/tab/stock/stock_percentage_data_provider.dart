import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

abstract mixin class StockPercentageDataProvider {
  int get currentPrice;

  int get yesterdayClosePrice;

  double get todayPercentage =>
      ((currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100)
          .toDouble();

  String get todayPercentageString =>
      "${symbol}${todayPercentage.toStringAsFixed(2)}%";

  bool get isPlus => currentPrice > yesterdayClosePrice;

  bool get isSame => currentPrice == yesterdayClosePrice;

  bool get isMinus => currentPrice < yesterdayClosePrice;

  String get symbol => isSame ? "" : (isPlus ? "+" : "");

  Color? getPriceColor(BuildContext context) => isSame
      ? context.appColors.lessImportantColor
      : (isPlus ? context.appColors.plus : context.appColors.blueText);
}
