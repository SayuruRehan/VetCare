import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentListRecord extends FirestoreRecord {
  AppointmentListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "VetName" field.
  String? _vetName;
  String get vetName => _vetName ?? '';
  bool hasVetName() => _vetName != null;

  // "PetName" field.
  String? _petName;
  String get petName => _petName ?? '';
  bool hasPetName() => _petName != null;

  // "VetSpeciality" field.
  String? _vetSpeciality;
  String get vetSpeciality => _vetSpeciality ?? '';
  bool hasVetSpeciality() => _vetSpeciality != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "Time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "IsUpcoming" field.
  bool? _isUpcoming;
  bool get isUpcoming => _isUpcoming ?? false;
  bool hasIsUpcoming() => _isUpcoming != null;

  void _initializeFields() {
    _vetName = snapshotData['VetName'] as String?;
    _petName = snapshotData['PetName'] as String?;
    _vetSpeciality = snapshotData['VetSpeciality'] as String?;
    _date = snapshotData['Date'] as DateTime?;
    _time = snapshotData['Time'] as String?;
    _isUpcoming = snapshotData['IsUpcoming'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AppointmentList');

  static Stream<AppointmentListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentListRecord.fromSnapshot(s));

  static Future<AppointmentListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentListRecord.fromSnapshot(s));

  static AppointmentListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentListRecordData({
  String? vetName,
  String? petName,
  String? vetSpeciality,
  DateTime? date,
  String? time,
  bool? isUpcoming,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'VetName': vetName,
      'PetName': petName,
      'VetSpeciality': vetSpeciality,
      'Date': date,
      'Time': time,
      'IsUpcoming': isUpcoming,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentListRecordDocumentEquality
    implements Equality<AppointmentListRecord> {
  const AppointmentListRecordDocumentEquality();

  @override
  bool equals(AppointmentListRecord? e1, AppointmentListRecord? e2) {
    return e1?.vetName == e2?.vetName &&
        e1?.petName == e2?.petName &&
        e1?.vetSpeciality == e2?.vetSpeciality &&
        e1?.date == e2?.date &&
        e1?.time == e2?.time &&
        e1?.isUpcoming == e2?.isUpcoming;
  }

  @override
  int hash(AppointmentListRecord? e) => const ListEquality().hash([
        e?.vetName,
        e?.petName,
        e?.vetSpeciality,
        e?.date,
        e?.time,
        e?.isUpcoming
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentListRecord;
}
