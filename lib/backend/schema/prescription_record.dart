import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrescriptionRecord extends FirestoreRecord {
  PrescriptionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "presId" field.
  String? _presId;
  String get presId => _presId ?? '';
  bool hasPresId() => _presId != null;

  // "presDate" field.
  DateTime? _presDate;
  DateTime? get presDate => _presDate;
  bool hasPresDate() => _presDate != null;

  // "expiryDate" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  // "imagepath" field.
  String? _imagepath;
  String get imagepath => _imagepath ?? '';
  bool hasImagepath() => _imagepath != null;

  void _initializeFields() {
    _presId = snapshotData['presId'] as String?;
    _presDate = snapshotData['presDate'] as DateTime?;
    _expiryDate = snapshotData['expiryDate'] as DateTime?;
    _imagepath = snapshotData['imagepath'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prescription');

  static Stream<PrescriptionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrescriptionRecord.fromSnapshot(s));

  static Future<PrescriptionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PrescriptionRecord.fromSnapshot(s));

  static PrescriptionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrescriptionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrescriptionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrescriptionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrescriptionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrescriptionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrescriptionRecordData({
  String? presId,
  DateTime? presDate,
  DateTime? expiryDate,
  String? imagepath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'presId': presId,
      'presDate': presDate,
      'expiryDate': expiryDate,
      'imagepath': imagepath,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrescriptionRecordDocumentEquality
    implements Equality<PrescriptionRecord> {
  const PrescriptionRecordDocumentEquality();

  @override
  bool equals(PrescriptionRecord? e1, PrescriptionRecord? e2) {
    return e1?.presId == e2?.presId &&
        e1?.presDate == e2?.presDate &&
        e1?.expiryDate == e2?.expiryDate &&
        e1?.imagepath == e2?.imagepath;
  }

  @override
  int hash(PrescriptionRecord? e) => const ListEquality()
      .hash([e?.presId, e?.presDate, e?.expiryDate, e?.imagepath]);

  @override
  bool isValidKey(Object? o) => o is PrescriptionRecord;
}
