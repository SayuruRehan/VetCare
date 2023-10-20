import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentRecord extends FirestoreRecord {
  AppointmentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "appointmentId" field.
  String? _appointmentId;
  String get appointmentId => _appointmentId ?? '';
  bool hasAppointmentId() => _appointmentId != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "vetName" field.
  String? _vetName;
  String get vetName => _vetName ?? '';
  bool hasVetName() => _vetName != null;

  // "petName" field.
  String? _petName;
  String get petName => _petName ?? '';
  bool hasPetName() => _petName != null;

  // "isComplete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  bool hasIsComplete() => _isComplete != null;

  // "vetSpeciality" field.
  String? _vetSpeciality;
  String get vetSpeciality => _vetSpeciality ?? '';
  bool hasVetSpeciality() => _vetSpeciality != null;

  // "vetImagePath" field.
  String? _vetImagePath;
  String get vetImagePath => _vetImagePath ?? '';
  bool hasVetImagePath() => _vetImagePath != null;

  void _initializeFields() {
    _appointmentId = snapshotData['appointmentId'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _vetName = snapshotData['vetName'] as String?;
    _petName = snapshotData['petName'] as String?;
    _isComplete = snapshotData['isComplete'] as bool?;
    _vetSpeciality = snapshotData['vetSpeciality'] as String?;
    _vetImagePath = snapshotData['vetImagePath'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointment');

  static Stream<AppointmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentRecord.fromSnapshot(s));

  static Future<AppointmentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentRecord.fromSnapshot(s));

  static AppointmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentRecordData({
  String? appointmentId,
  DateTime? date,
  String? vetName,
  String? petName,
  bool? isComplete,
  String? vetSpeciality,
  String? vetImagePath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'appointmentId': appointmentId,
      'date': date,
      'vetName': vetName,
      'petName': petName,
      'isComplete': isComplete,
      'vetSpeciality': vetSpeciality,
      'vetImagePath': vetImagePath,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentRecordDocumentEquality implements Equality<AppointmentRecord> {
  const AppointmentRecordDocumentEquality();

  @override
  bool equals(AppointmentRecord? e1, AppointmentRecord? e2) {
    return e1?.appointmentId == e2?.appointmentId &&
        e1?.date == e2?.date &&
        e1?.vetName == e2?.vetName &&
        e1?.petName == e2?.petName &&
        e1?.isComplete == e2?.isComplete &&
        e1?.vetSpeciality == e2?.vetSpeciality &&
        e1?.vetImagePath == e2?.vetImagePath;
  }

  @override
  int hash(AppointmentRecord? e) => const ListEquality().hash([
        e?.appointmentId,
        e?.date,
        e?.vetName,
        e?.petName,
        e?.isComplete,
        e?.vetSpeciality,
        e?.vetImagePath
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentRecord;
}
