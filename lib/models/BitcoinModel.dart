class Bitcoin {
    final String name;
    final String symbol;
    final int num_market_pairs;
    final double price;

  Bitcoin({this.name, this.symbol, this.num_market_pairs, this.price});

  factory Bitcoin.fromJson(Map<String, dynamic> json){
    return new Bitcoin(
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      num_market_pairs: json['num_market_pairs'] as int,
      price: json['price'] as double,

    );
  }


}