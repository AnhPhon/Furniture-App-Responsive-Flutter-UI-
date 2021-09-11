class Category {
  final String id, title, image;
  final int? numOfProducts;

  Category(
      {required this.id,
      required this.title,
      required this.image,
      required this.numOfProducts});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      numOfProducts: json['numOfProducts'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['numberOfProducts'] = this.numOfProducts;
    return data;
  }
}

//Demo category
Category category = Category(
    id: '1',
    image: 'https://i.imgur.com/JqKDdxj.png',
    title: 'Armchair',
    numOfProducts: 100);
