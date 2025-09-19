
class NotificationModel {
  final int id;
  final String title;
  final String icon;
  final String content;
  final DateTime date;

  NotificationModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.content,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    title: json["title"],
    icon: json["icon"],
    content: json["content"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "icon": icon,
    "content": content,
    "date": date.toIso8601String(),
  };
}
