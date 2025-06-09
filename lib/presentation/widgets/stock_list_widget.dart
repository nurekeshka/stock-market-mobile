import 'package:flutter/material.dart';
import 'package:stock_market_mobile/presentation/widgets/stock_item_widget.dart';

class StockListWidget extends StatelessWidget {
  final List<StockItemData> stocks;

  const StockListWidget({super.key, required this.stocks});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(0, 10, 0, 0),
          child: Column(
            spacing: 10,
            children:
                stocks
                    .map((StockItemData data) => StockItemWidget(data: data))
                    .toList(),
          ),
        ),
      ),
    );
  }
}
