class Category {
  final String id;
  final String name;
  final String imageLink;

  const Category({
    required this.id,
    required this.name,
    required this.imageLink,
  });

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageLink = json['image'];
}
