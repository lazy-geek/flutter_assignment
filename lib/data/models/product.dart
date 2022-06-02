class Product {
  final int id;
  final String productName;
  final String productUrl;
  final int productRating;
  final String productDescription;

  Product({
    required this.id,
    required this.productName,
    required this.productUrl,
    required this.productRating,
    required this.productDescription,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productName: json["productName"],
        productUrl: json["productUrl"],
        productRating: json["productRating"],
        productDescription: json["productDescription"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "productUrl": productUrl,
        "productRating": productRating,
        "productDescription": productDescription,
      };
}
