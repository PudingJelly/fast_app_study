import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/popular_stock_dummy.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_stock_item.dart';
import 'package:flutter/material.dart';

class PopularSearchStockList extends StatelessWidget {
  const PopularSearchStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            '인기검색'.text.bold.make(),
            emptyExpended,
            '오늘${DateTime.now().formattedTime} 기준'
                .text
                .size(12)
                .color(context.appColors.lessImportantColor)
                .make(),
          ],
        ),
        height20,
        ...popularStockList
            .mapIndexed(
                (e, index) => PopularStockItem(stock: e, number: index + 1))
            .toList()
      ],
    ).pSymmetric(h: 20);
  }
}
