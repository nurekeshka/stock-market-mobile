import 'package:flutter/material.dart';
import 'package:stock_market_mobile/core/theme/colors.dart';
import 'package:stock_market_mobile/domain/entities/stock_entity.dart';

class StockItemData {
  final StockEntity stock;
  final String image;
  final double change;

  const StockItemData({
    required this.stock,
    required this.image,
    required this.change,
  });
}

class StockItemWidget extends StatelessWidget {
  final StockItemData data;
  final VoidCallback? onTap;

  const StockItemWidget({super.key, required this.data, this.onTap});

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

    final double size = 60;
    final TextStyle boldStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: textColor,
    );

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: size,
        child: Row(
          spacing: size / 6,
          children: [
            CircleAvatar(
              radius: size / 2,
              backgroundImage: NetworkImage(data.image),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: size / 12,
                children: [
                  Text(data.stock.name, style: boldStyle),
                  Text(
                    data.stock.shares == 0
                        ? "${data.stock.ticker} • ${data.stock.currency}${data.stock.price}"
                        : "${data.stock.shares.toString()} ${data.stock.ticker} • ${data.stock.currency}${data.stock.price}",
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: size / 12,
              children: [
                Text(
                  "${data.stock.currency} ${(data.stock.shares == 0 ? data.stock.price : data.stock.price * data.stock.shares).toStringAsFixed(2)}",
                  style: boldStyle,
                ),
                Text(
                  "${data.change.abs()}%",
                  style: TextStyle(
                    color:
                        data.change > 0
                            ? DesignColors.skirretGreen.color
                            : DesignColors.nasturcianFlower.color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
