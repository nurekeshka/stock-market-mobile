class StockEntity {
  final String name;
  final String ticker;
  final double price;
  String currency;
  double shares;

  StockEntity({
    required this.name,
    required this.ticker,
    required this.price,
    this.currency = "€",
    this.shares = 0,
  });
}
