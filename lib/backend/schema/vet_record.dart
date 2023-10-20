import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VetRecord extends FirestoreRecord {
  VetRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "vetId" field.
  String? _vetId;
  String get vetId => _vetId ?? '';
  bool hasVetId() => _vetId != null;

  // "vetName" field.
  String? _vetName;
  String get vetName => _vetName ?? '';
  bool hasVetName() => _vetName != null;

  // "vetPhoneNum" field.
  String? _vetPhoneNum;
  String get vetPhoneNum => _vetPhoneNum ?? '';
  bool hasVetPhoneNum() => _vetPhoneNum != null;

  // "vetEmail" field.
  String? _vetEmail;
  String get vetEmail => _vetEmail ?? '';
  bool hasVetEmail() => _vetEmail != null;

  // "vetSpeciality" field.
  String? _vetSpeciality;
  String get vetSpeciality => _vetSpeciality ?? '';
  bool hasVetSpeciality() => _vetSpeciality != null;

  // "presId" field.
  String? _presId;
  String get presId => _presId ?? '';
  bool hasPresId() => _presId != null;

  // "appointmentId" field.
  String? _appointmentId;
  String get appointmentId => _appointmentId ?? '';
  bool hasAppointmentId() => _appointmentId != null;

  // "vetImagePath" field.
  String? _vetImagePath;
  String get vetImagePath => _vetImagePath ?? '';
  bool hasVetImagePath() => _vetImagePath != null;

  void _initializeFields() {
    _vetId = snapshotData['vetId'] as String?;
    _vetName = snapshotData['vetName'] as String?;
    _vetPhoneNum = snapshotData['vetPhoneNum'] as String?;
    _vetEmail = snapshotData['vetEmail'] as String?;
    _vetSpeciality = snapshotData['vetSpeciality'] as String?;
    _presId = snapshotData['presId'] as String?;
    _appointmentId = snapshotData['appointmentId'] as String?;
    _vetImagePath = snapshotData['vetImagePath'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vet');

  static Stream<VetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VetRecord.fromSnapshot(s));

  static Future<VetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VetRecord.fromSnapshot(s));

  static VetRecord fromSnapshot(DocumentSnapshot snapshot) => VetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVetRecordData({
  String? vetId,
  String? vetName,
  String? vetPhoneNum,
  String? vetEmail,
  String? vetSpeciality,
  String? presId,
  String? appointmentId,
  String? vetImagePath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vetId': vetId,
      'vetName': vetName,
      'vetPhoneNum': vetPhoneNum,
      'vetEmail': vetEmail,
      'vetSpeciality': vetSpeciality,
      'presId': presId,
      'appointmentId': appointmentId,
      'vetImagePath': vetImagePath,
    }.withoutNulls,
  );

  return firestoreData;
}

class VetRecordDocumentEquality implements Equality<VetRecord> {
  const VetRecordDocumentEquality();

  @override
  bool equals(VetRecord? e1, VetRecord? e2) {
    return e1?.vetId == e2?.vetId &&
        e1?.vetName == e2?.vetName &&
        e1?.vetPhoneNum == e2?.vetPhoneNum &&
        e1?.vetEmail == e2?.vetEmail &&
        e1?.vetSpeciality == e2?.vetSpeciality &&
        e1?.presId == e2?.presId &&
        e1?.appointmentId == e2?.appointmentId &&
        e1?.vetImagePath == e2?.vetImagePath;
  }

  @override
  int hash(VetRecord? e) => const ListEquality().hash([
        e?.vetId,
        e?.vetName,
        e?.vetPhoneNum,
        e?.vetEmail,
        e?.vetSpeciality,
        e?.presId,
        e?.appointmentId,
        e?.vetImagePath
      ]);

  @override
  bool isValidKey(Object? o) => o is VetRecord;
}
