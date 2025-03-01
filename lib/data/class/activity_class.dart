class Activity {
  final String activity;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;
  final double accessibility;

  Activity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  // Tạo phương thức để chuyển từ JSON sang đối tượng Dart
  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json['activity'] ?? '',
      type: json['type'] ?? '',
      participants: json['participants'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
      link: json['link'] ?? '',
      key: json['key'] ?? '',
      accessibility: (json['accessibility'] ?? 0).toDouble(),
    );
  }

  // Tạo phương thức để chuyển từ đối tượng Dart sang JSON
  Map<String, dynamic> toJson() {
    return {
      'activity': activity,
      'type': type,
      'participants': participants,
      'price': price,
      'link': link,
      'key': key,
      'accessibility': accessibility,
    };
  }
}
