class ServiceModel {
  String id;
  String title;
  String? image;
  String description;
  double price;
  String domain;
  double days;

  ServiceModel(
      {this.id = '',
      required this.title,
      this.image,
      required this.description,
      required this.price,
      required this.domain,
      required this.days});
  Map<String, dynamic> toJason() => {
        'id': id,
        'title': title,
        'image': image,
        'description': description,
        'price': price,
        'domain': domain,
        'days': days
      };
  static ServiceModel fromJson(Map<String, dynamic> json) => ServiceModel(
        title: json['title'],
        image: json['image'],
        description: json['description'],
        price: json['price'],
        domain: json['domain'],
        days: json['days'],
      );
}
