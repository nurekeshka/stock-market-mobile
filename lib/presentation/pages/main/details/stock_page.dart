import 'package:flutter/material.dart';

import '../../../../domain/entities/stock_entity.dart';

class StockPage extends StatelessWidget {
  final StockEntity stock;

  const StockPage({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Text(stock.name);
  }
}
