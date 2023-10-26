import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrescriptionListRecord extends FirestoreRecord {
  PrescriptionListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "PetName" field.
  String? _petName;
  String get petName => _petName ?? '';
  bool hasPetName() => _petName != null;

  // "VetName" field.
  String? _vetName;
  String get vetName => _vetName ?? '';
  bool hasVetName() => _vetName != null;

  // "ExpDate" field.
  DateTime? _expDate;
  DateTime? get expDate => _expDate;
  bool hasExpDate() => _expDate != null;

  // "PrescribedDate" field.
  DateTime? _prescribedDate;
  DateTime? get prescribedDate => _prescribedDate;
  bool hasPrescribedDate() => _prescribedDate != null;

  void _initializeFields() {
    _petName = snapshotData['PetName'] as String?;
    _vetName = snapshotData['VetName'] as String?;
    _expDate = snapshotData['ExpDate'] as DateTime?;
    _prescribedDate = snapshotData['PrescribedDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PrescriptionList');

  static Stream<PrescriptionListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrescriptionListRecord.fromSnapshot(s));

  static Future<PrescriptionListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PrescriptionListRecord.fromSnapshot(s));

  static PrescriptionListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrescriptionListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrescriptionListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrescriptionListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrescriptionListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrescriptionListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrescriptionListRecordData({
  String? petName,
  String? vetName,
  DateTime? expDate,
  DateTime? prescribedDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PetName': petName,
      'VetName': vetName,
      'ExpDate': expDate,
      'PrescribedDate': prescribedDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrescriptionListRecordDocumentEquality
    implements Equality<PrescriptionListRecord> {
  const PrescriptionListRecordDocumentEquality();

  @override
  bool equals(PrescriptionListRecord? e1, PrescriptionListRecord? e2) {
    return e1?.petName == e2?.petName &&
        e1?.vetName == e2?.vetName &&
        e1?.expDate == e2?.expDate &&
        e1?.prescribedDate == e2?.prescribedDate;
  }

  @override
  int hash(PrescriptionListRecord? e) => const ListEquality()
      .hash([e?.petName, e?.vetName, e?.expDate, e?.prescribedDate]);

  @override
  bool isValidKey(Object? o) => o is PrescriptionListRecord;
}
