class EventDM {
  String id;
  String title;
  String description;
  String image;
  DateTime date;
  String category;
  bool isFavorite;

  EventDM({
    this.id = "",
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    this.isFavorite = false,
    required this.image,
  });

  factory EventDM.fromFireStore(Map<String, dynamic> json) => EventDM(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
        date: DateTime.fromMillisecondsSinceEpoch(json["date"]),
        isFavorite: json["isFavorite"],
      );

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "category": category,
      "image": image,
      "date": date.millisecondsSinceEpoch,
      "isFavorite": isFavorite,
    };
  }
}
