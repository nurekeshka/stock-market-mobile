class StockEntity {
  final String name;
  final String ticker;
  final double price;
  String currency;
  double shares;
  String icon;
  double percentage;

  StockEntity({
    required this.name,
    required this.ticker,
    required this.price,
    this.currency = "€",
    this.shares = 0,
    this.icon = '',
    this.percentage = 0,
  });

  double value() {
    return shares * price;
  }
}
