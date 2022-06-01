class Coupons {
  String title;
  String subtitle;
  String image;

  Coupons({
    required this.title,
    required this.subtitle,
    required this.image
  });

  factory Coupons.fromJson(Map<String, dynamic> json) {
    return Coupons(
        title: json['title'], subtitle: json['subtitle'], image: json['image']);
  }
  Coupons.fromSnapshot(snapshot):
      image = snapshot.data()['image'],
      subtitle = snapshot.data()['subtitle'],
        title = snapshot.data()['title'];
}
