class TelegramBot {
  final String id;
  final String name;
  final String token;
  final String username;
  final bool isActive;
  final DateTime createdAt;

  TelegramBot({
    required this.id,
    required this.name,
    required this.token,
    required this.username,
    this.isActive = true,
    required this.createdAt,
  });

  factory TelegramBot.fromJson(Map<String, dynamic> json) {
    return TelegramBot(
      id: json['id'] as String,
      name: json['name'] as String,
      token: json['token'] as String,
      username: json['username'] as String,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'token': token,
      'username': username,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
