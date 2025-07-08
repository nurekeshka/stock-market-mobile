import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stock_market_mobile/core/constants/icons.dart';
import 'package:stock_market_mobile/core/theme/colors.dart';
import 'package:stock_market_mobile/domain/entities/stock_entity.dart';

// ignore: must_be_immutable
class HomeTab extends StatelessWidget {
  final List<StockEntity> stocks = [
    StockEntity(
      name: 'iShares Core S&P 500',
      ticker: 'IUSA',
      shares: 50.43,
      price: 46.37,
      currency: '€',
      icon: 'assets/images/stocks/ishares-iusa.png',
    ),
    StockEntity(
      name: 'SAP',
      ticker: 'SAP',
      price: 262.81,
      shares: 20.25,
      currency: '\$',
      icon: 'assets/images/stocks/sap.png',
    ),
    StockEntity(
      name: 'Nvidia',
      ticker: 'NVDA',
      shares: 14.34,
      price: 101.28,
      currency: '\$',
      icon: 'assets/images/stocks/nvidia.png',
    ),
    StockEntity(
      name: 'Pinduoduo Inc',
      ticker: 'PDD',
      shares: 30.55,
      price: 91.55,
      currency: '\$',
      icon: 'assets/images/stocks/pinduoduo.png',
    ),
    StockEntity(
      name: 'Berkshire Hathaway',
      ticker: 'BRK.B',
      shares: 10.43,
      price: 518.50,
      currency: '\$',
      icon: 'assets/images/stocks/berkshire.png',
    ),
    StockEntity(
      name: 'Bayer AG',
      ticker: 'BAYN',
      shares: 143.35,
      price: 21.02,
      currency: '€',
      icon: 'assets/images/stocks/bayer.png',
    ),
    StockEntity(
      name: 'Lang & Schwarz AG',
      ticker: 'LUS1',
      shares: 32.54,
      price: 23.80,
      currency: '€',
      icon: 'assets/images/stocks/lang.png',
    ),
    StockEntity(
      name: 'Alphabet (Class C)',
      ticker: 'GOOG',
      shares: 22.33,
      price: 153.33,
      currency: '\$',
      icon: 'assets/images/stocks/google.png',
    ),
  ];

  double total = 0;

  final VoidCallback onProfileTap;

  HomeTab({super.key, required this.onProfileTap}) {
    total = _getTotal();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor =
        isDarkMode
            ? DesignColors.lynxWhite.color
            : DesignColors.electromagnetic.color;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 60,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    isDarkMode
                        ? 'assets/images/home-bg.png'
                        : 'assets/images/home-bg-light.png',
                  ),
                  fit: BoxFit.fitWidth,
                  colorFilter: ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Column(
                children: [
                  _buildFinancesValue(textColor),
                  const SizedBox(height: 24),
                  SizedBox(height: 200, child: _buildLineChart(textColor)),
                ],
              ),
            ),

            const SizedBox(height: 24),
            _buildOverviewSection(isDarkMode),
          ],
        ),
      ),
    );
  }

  Widget _buildFinancesValue(Color textColor) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          const Text(
            'Finances Value',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            '\$${_formatNumber(total)}',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${_getTotalChangeString()}    ${_getPercentageString()}',
            style: TextStyle(
              color:
                  _getTotalChange() > 0
                      ? DesignColors.skirretGreen.color
                      : DesignColors.nasturcianFlower.color,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onProfileTap,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/angela.png'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              filled: true,
              fillColor: DesignColors.lynxWhite.color,
              prefixIcon: AppIcons.getIcon(
                AppIconsEnum.lense,
                DesignColors.electromagnetic.color,
                16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 8,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        IconButton(icon: const Icon(Icons.calendar_today), onPressed: () {}),
        IconButton(icon: const Icon(Icons.bar_chart), onPressed: () {}),
      ],
    );
  }

  Widget _buildLineChart(Color textColor) {
    final List<FlSpot> points = [];

    for (var i = 0; i < 50; i++) {
      points.add(FlSpot(i.toDouble(), Random().nextDouble()));
    }

    return LineChart(
      LineChartData(
        backgroundColor: Colors.transparent,
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: points,
            isCurved: true,
            color: textColor,
            barWidth: 2,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewSection(bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.5),
        borderRadius: BorderRadius.circular(8),
        color: DesignColors.electromagnetic.color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overview',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...stocks.map((stock) => _buildStockItem(stock, isDarkMode)),
        ],
      ),
    );
  }

  Widget _buildStockItem(StockEntity stock, bool isDarkMode) {
    final isPositive = stock.percentage > 0;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      color: DesignColors.blueNights.color,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(stock.icon),
        ),
        title: Text(
          stock.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: DesignColors.lynxWhite.color,
          ),
        ),
        horizontalTitleGap: 12,
        subtitle: Text(
          '${stock.shares} ${stock.ticker} • ${stock.currency}${stock.price}',
          style: TextStyle(fontSize: 12, color: DesignColors.lynxWhite.color),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${stock.currency}${_formatNumber(stock.value())}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: DesignColors.lynxWhite.color,
              ),
            ),
            Text(
              '${isPositive ? '+' : ''}${stock.percentage.toStringAsFixed(2)}%',
              style: TextStyle(
                color:
                    isPositive
                        ? DesignColors.skirretGreen.color
                        : DesignColors.nasturcianFlower.color,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatNumber(double number) {
    return NumberFormat('#,###').format(number).replaceAll(',', ' ');
  }

  double _getPercentage() {
    double totalChange = _getTotalChange();
    return ((totalChange + total) / total);
  }

  String _getPercentageString() {
    final absoluteChangeString = (_getPercentage() * 100).toStringAsFixed(2);
    final totalChange = _getTotalChange();

    if (totalChange > 0) {
      return '↑ $absoluteChangeString%';
    } else if (totalChange < 0) {
      return '↓ $absoluteChangeString%';
    } else {
      return '$absoluteChangeString%';
    }
  }

  double _getTotal() {
    double total = 0;

    for (var stock in stocks) {
      total += stock.value();
      stock.percentage = Random().nextDouble() * 50;
      if (Random().nextBool()) {
        stock.percentage = stock.percentage * -1;
      }
    }

    return total;
  }

  double _getTotalChange() {
    double totalChange = 0;

    for (var stock in stocks) {
      final double change = stock.value() * (stock.percentage / 100);
      totalChange += change;
    }

    return totalChange;
  }

  String _getTotalChangeString() {
    double number = _getTotalChange();

    if (number > 0) {
      return '+ \$${_formatNumber(number)}';
    } else if (number < 0) {
      return '- \$${_formatNumber(number.abs())}';
    } else {
      return '\$${_formatNumber(number)}';
    }
  }
}
