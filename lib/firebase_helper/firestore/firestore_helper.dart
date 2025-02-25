import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/EventDM.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirestoreHelper {
  static CollectionReference<EventDM> getCollectionReference() {
    return FirebaseFirestore.instance
        .collection('Events')
        .withConverter<EventDM>(
          fromFirestore: (snapshot, _) =>
              EventDM.fromFireStore(snapshot.data()!),
          toFirestore: (eventDM, _) => eventDM.toFireStore(),
        );
  }

  static Future<void> addEvent(EventDM event) async {
    try {
      var collectionRef = getCollectionReference();
      var docRef = collectionRef.doc();
      event.id = docRef.id;
      docRef.set(event);
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  static Future<List<EventDM>> getAllEvents(EventDM event) async {
    var collectionRef = getCollectionReference();
    QuerySnapshot<EventDM> querySnapshot = await collectionRef.get();

    List<EventDM> events = querySnapshot.docs.map((doc) => doc.data()).toList();
    return events;
  }

  static Stream<QuerySnapshot<EventDM>> getStreamFavoriteData() {
    var collectionRef = getCollectionReference().where(
      "isFavorite",
      isEqualTo: true,
    );
    return collectionRef.snapshots();
  }

  static Stream<QuerySnapshot<EventDM>> getEventsByCategory(
      String categoryName){
    var user = FirebaseAuth.instance.currentUser;
    var collectionRef = getCollectionReference()
        .where("category", isEqualTo: categoryName,);

    return collectionRef.snapshots();
  }

  static Future<bool> deleteEvent(EventDM event) async {
    try {
      var collectionRef = getCollectionReference();
      var docRef = collectionRef.doc(event.id);

      docRef.delete();
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  static Future<bool> updateEvent(EventDM event) async {
    try {
      var collectionRef = getCollectionReference();
      var docRef = collectionRef.doc(event.id);

      print("Data being sent to Firestore: ${event.toFireStore()}");
      var dataToSend = event.toFireStore();
      print("Data being sent to Firestore: $dataToSend");
      await docRef.update(
        dataToSend,
      );
      print("Event updated successfully in Firestore.");

      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }
}
