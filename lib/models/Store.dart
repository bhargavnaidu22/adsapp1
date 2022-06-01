class Store {
  String title;
  String subtitle;
  String image;

  Store({
        required this.title,
        required this.subtitle,
        required this.image
      });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
        title: json['title'], subtitle: json['subtitle'], image: json['image']);
  }
}
