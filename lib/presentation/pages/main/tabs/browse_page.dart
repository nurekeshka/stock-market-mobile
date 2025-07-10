import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stock_market_mobile/data/datasources/api_connector.dart';
import 'package:stock_market_mobile/presentation/widgets/stock_list_widget.dart';

import '../../../../core/theme/colors.dart';
import '../../../../domain/entities/stock_entity.dart';
import '../../../widgets/stock_item_widget.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  BrowseTabState createState() => BrowseTabState();
}

class BrowseTabState extends State<BrowseTab> {
  List<dynamic> stocks = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor =
        isDarkMode
            ? DesignColors.lynxWhite.color
            : DesignColors.electromagnetic.color;

    final bgColor =
        isDarkMode
            ? DesignColors.electromagnetic.color
            : DesignColors.lynxWhite.color;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Your next investment step?',
              labelStyle: TextStyle(color: textColor, backgroundColor: bgColor),
              prefixIcon: Icon(Icons.search, color: textColor),
            ),
            onSubmitted: (value) async {
              final url = Uri.parse(
                "finnhub/symbols?query=${value.toLowerCase()}",
              );

              setState(() {
                loading = true;
              });

              final res = await ApiConnector.get(url);

              if (res.statusCode == 200) {
                final body = jsonDecode(res.body);
                setState(() {
                  stocks = body;
                  loading = false;
                });
              }
            },
            style: TextStyle(backgroundColor: bgColor),
          ),
          loading
              ? Expanded(child: Center(child: CircularProgressIndicator()))
              : StockListWidget(
                stocks:
                    stocks
                        .map(
                          (value) => StockItemData(
                            stock: StockEntity(
                              name: value["description"],
                              ticker: value["symbol"],
                              price: 46.37,
                            ),
                            change: 14.33,
                            image:
                                "https://www.marketbeat.com/logos/ishares-gold-strategy-etf-logo.png?v=20220819113202",
                          ),
                        )
                        .toList(),
              ),
        ],
      ),
    );
  }
}
