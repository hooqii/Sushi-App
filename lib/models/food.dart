class Food {
  String name;
  String price;
  String imagePath;
  String rating;
  List <Map<String, String>> ingredients;

  Food({required this.name, required this.price, required this.imagePath, required this.rating, required this.ingredients});

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _rating => rating;
  List <Map<String, String>> get _ingredients => ingredients;
}