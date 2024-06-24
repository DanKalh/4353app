import 'package:cloud_firestore/cloud_firestore.dart';

class EventService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createEvent(Map<String, dynamic> eventData) async {
    await _firestore.collection('events').add(eventData);
  }

  Future<void> updateEvent(String eventId, Map<String, dynamic> eventData) async {
    await _firestore.collection('events').doc(eventId).update(eventData);
  }

  Future<void> deleteEvent(String eventId) async {
    await _firestore.collection('events').doc(eventId).delete();
  }

  Stream<QuerySnapshot> getEvents() {
    return _firestore.collection('events').snapshots();
  }
}
