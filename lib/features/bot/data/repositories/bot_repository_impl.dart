import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/bot.dart';
import '../../domain/repositories/bot_repository.dart';

class BotRepositoryImpl implements BotRepository {
  final FirebaseFirestore _firestore;

  BotRepositoryImpl({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<Bot>> getBots(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('bots')
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Bot(
          id: doc.id,
          name: data['name'],
          token: data['token'],
          description: data['description'],
          createdAt: (data['createdAt'] as Timestamp).toDate(),
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to get bots: $e');
    }
  }

  @override
  Future<Bot> getBot(String userId, String botId) async {
    try {
      final doc = await _firestore
          .collection('users')
          .doc(userId)
          .collection('bots')
          .doc(botId)
          .get();

      if (!doc.exists) {
        throw Exception('Bot not found');
      }

      final data = doc.data()!;
      return Bot(
        id: doc.id,
        name: data['name'],
        token: data['token'],
        description: data['description'],
        createdAt: (data['createdAt'] as Timestamp).toDate(),
      );
    } catch (e) {
      throw Exception('Failed to get bot: $e');
    }
  }

  @override
  Future<void> createBot(String userId, Bot bot) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('bots')
          .doc(bot.id)
          .set({
        'name': bot.name,
        'token': bot.token,
        'description': bot.description,
        'createdAt': Timestamp.fromDate(bot.createdAt),
      });
    } catch (e) {
      throw Exception('Failed to create bot: $e');
    }
  }

  @override
  Future<void> updateBot(String userId, Bot bot) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('bots')
          .doc(bot.id)
          .update({
        'name': bot.name,
        'description': bot.description,
      });
    } catch (e) {
      throw Exception('Failed to update bot: $e');
    }
  }

  @override
  Future<void> deleteBot(String userId, String botId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('bots')
          .doc(botId)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete bot: $e');
    }
  }
}
