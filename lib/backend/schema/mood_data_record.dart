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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "mood" field.
  int? _mood;
  int get mood => _mood ?? 0;
  bool hasMood() => _mood != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  bool hasLabel() => _label != null;

  // "emoji" field.
  String? _emoji;
  String get emoji => _emoji ?? '';
  bool hasEmoji() => _emoji != null;

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  bool hasDay() => _day != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _mood = castToType<int>(snapshotData['mood']);
    _label = snapshotData['label'] as String?;
    _emoji = snapshotData['emoji'] as String?;
    _day = castToType<int>(snapshotData['day']);
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
  String? description,
  DocumentReference? userId,
  int? mood,
  String? label,
  String? emoji,
  int? day,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'description': description,
      'user_id': userId,
      'mood': mood,
      'label': label,
      'emoji': emoji,
      'day': day,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoodDataRecordDocumentEquality implements Equality<MoodDataRecord> {
  const MoodDataRecordDocumentEquality();

  @override
  bool equals(MoodDataRecord? e1, MoodDataRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.description == e2?.description &&
        e1?.userId == e2?.userId &&
        e1?.mood == e2?.mood &&
        e1?.label == e2?.label &&
        e1?.emoji == e2?.emoji &&
        e1?.day == e2?.day;
  }

  @override
  int hash(MoodDataRecord? e) => const ListEquality().hash([
        e?.date,
        e?.description,
        e?.userId,
        e?.mood,
        e?.label,
        e?.emoji,
        e?.day
      ]);

  @override
  bool isValidKey(Object? o) => o is MoodDataRecord;
}
