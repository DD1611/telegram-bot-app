import 'dart:convert';
import 'package:http/http.dart' as http;

class TelegramBotService {
  final String botToken;
  static const String _baseUrl = 'https://api.telegram.org/bot';

  TelegramBotService({required this.botToken});

  String get _apiUrl => '$_baseUrl$botToken';

  Future<Map<String, dynamic>> getMe() async {
    final response = await http.get(Uri.parse('$_apiUrl/getMe'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get bot info: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> sendMessage({
    required String chatId,
    required String text,
    String? parseMode,
    bool? disableWebPagePreview,
    bool? disableNotification,
    int? replyToMessageId,
  }) async {
    final Map<String, dynamic> body = {
      'chat_id': chatId,
      'text': text,
    };

    if (parseMode != null) body['parse_mode'] = parseMode;
    if (disableWebPagePreview != null)
      body['disable_web_page_preview'] = disableWebPagePreview;
    if (disableNotification != null)
      body['disable_notification'] = disableNotification;
    if (replyToMessageId != null)
      body['reply_to_message_id'] = replyToMessageId;

    final response = await http.post(
      Uri.parse('$_apiUrl/sendMessage'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to send message: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> getUpdates({
    int? offset,
    int? limit,
    int? timeout,
    List<String>? allowedUpdates,
  }) async {
    final Map<String, dynamic> queryParams = {};
    if (offset != null) queryParams['offset'] = offset;
    if (limit != null) queryParams['limit'] = limit;
    if (timeout != null) queryParams['timeout'] = timeout;
    if (allowedUpdates != null)
      queryParams['allowed_updates'] = json.encode(allowedUpdates);

    final uri =
        Uri.parse('$_apiUrl/getUpdates').replace(queryParameters: queryParams);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get updates: ${response.statusCode}');
    }
  }
}
