import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_market_mobile/presentation/widgets/stock_list_widget.dart';

import '../../../../core/theme/colors.dart';
import '../../../../domain/entities/stock_entity.dart';
import '../../../widgets/stock_item_widget.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  BrowsePageState createState() => BrowsePageState();
}

class BrowsePageState extends State<BrowsePage> {
  List<dynamic> stocks = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Your next investment step?',
              labelStyle: TextStyle(
                color: DesignColors.lynxWhite.color,
                backgroundColor: DesignColors.electromagnetic.color,
              ),
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) async {
              final url = Uri.parse(
                "http://localhost:8080/finnhub/symbols?query=${value.toLowerCase()}",
              );

              setState(() {
                loading = true;
              });

              final res = await http.get(url);

              if (res.statusCode == 200) {
                final body = jsonDecode(res.body);
                setState(() {
                  stocks = body;
                  loading = false;
                });
              }
            },
            style: TextStyle(
              backgroundColor: DesignColors.electromagnetic.color,
            ),
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
