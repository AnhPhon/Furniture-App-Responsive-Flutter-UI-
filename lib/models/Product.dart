class Product {
  final int price;
  final String id, title, category, image, subTitle, description;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.image,
      required this.subTitle,
      required this.description});

  //it create ab Category from Json

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        category: json['category'],
        id: json['id'],
        description: json['description'],
        image: json['image'],
        price: json['price'],
        subTitle: json['subTitle'],
        title: json['title']);
  }
}

// demo product
Product product = new Product(
    id: '1',
    price: 1600,
    image: 'https://i.imgur.com/sI4GvE6.png',
    subTitle: 'Tieton Armchair',
    category: 'Chair',
    description: description,
    title: 'Wood Frame');

String description =
    'This armchair in a elegant and functional piece if furniture';
