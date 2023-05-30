class Food {
  Food({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.availability,
    required this.favorite,
    required this.description,
  });

  String id;
  String image;
  String name;
  int price;
  double rate;
  String availability;
  String favorite;
  String description;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        rate: json["rate"].toDouble(),
        availability: json["availability"],
        favorite: json["cooking_time"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "price": price,
        "rate": rate,
        "availability": availability,
        "favorite": favorite,
        "description": description,
      };
}

final dummyFoods = [
  Food(
    id: '1',
    image: 'images/tomato.png',
    name: 'طماطم',
    price: 15,
    rate: 4.5,
    availability: 'متوفر',
    favorite: 'مفضلة',
    description: 'هنا الوصف مال اكل',
  ),
  Food(
    id: '2',
    image: 'images/carrot.png',
    name: 'جزر',
    price: 20,
    rate: 4.5,
    availability: 'متوفر',
    favorite: 'مفضلة',
    description: 'هنا الوصف مال اكل',
  ),
  Food(
    id: '3',
    image: 'images/banana.png',
    name: 'موز',
    price: 10,
    rate: 4,
    availability: 'متوفر',
    favorite: 'مفضلة',
    description: 'هنا الوصف مال اكل',
  ),
  Food(
    id: '4',
    image: 'images/water_melon.png',
    name: 'بطيخ',
    price: 12,
    rate: 4.8,
    availability: 'متوفر',
    favorite: 'مفضلة',
    description: 'هنا الوصف مال اكل',
  ),
];
