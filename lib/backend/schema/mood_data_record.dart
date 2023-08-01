import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodDataRecord extends FirestoreRecord {
  MoodDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "mood" field.
  int? _mood;
  int get mood => _mood ?? 0;
  bool hasMood() => _mood != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _mood = castToType<int>(snapshotData['mood']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mood_data');

  static Stream<MoodDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoodDataRecord.fromSnapshot(s));

  static Future<MoodDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoodDataRecord.fromSnapshot(s));

  static MoodDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MoodDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoodDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoodDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoodDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoodDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoodDataRecordData({
  DateTime? date,
  int? mood,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'mood': mood,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoodDataRecordDocumentEquality implements Equality<MoodDataRecord> {
  const MoodDataRecordDocumentEquality();

  @override
  bool equals(MoodDataRecord? e1, MoodDataRecord? e2) {
    return e1?.date == e2?.date && e1?.mood == e2?.mood;
  }

  @override
  int hash(MoodDataRecord? e) => const ListEquality().hash([e?.date, e?.mood]);

  @override
  bool isValidKey(Object? o) => o is MoodDataRecord;
}
