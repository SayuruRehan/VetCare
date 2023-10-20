import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetRecord extends FirestoreRecord {
  PetRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "petId" field.
  String? _petId;
  String get petId => _petId ?? '';
  bool hasPetId() => _petId != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  bool hasOwnerId() => _ownerId != null;

  // "petName" field.
  String? _petName;
  String get petName => _petName ?? '';
  bool hasPetName() => _petName != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  bool hasWeight() => _weight != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "breed" field.
  String? _breed;
  String get breed => _breed ?? '';
  bool hasBreed() => _breed != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "imagepath" field.
  String? _imagepath;
  String get imagepath => _imagepath ?? '';
  bool hasImagepath() => _imagepath != null;

  // "ownerName" field.
  String? _ownerName;
  String get ownerName => _ownerName ?? '';
  bool hasOwnerName() => _ownerName != null;

  // "phoneNum" field.
  String? _phoneNum;
  String get phoneNum => _phoneNum ?? '';
  bool hasPhoneNum() => _phoneNum != null;

  // "presId" field.
  String? _presId;
  String get presId => _presId ?? '';
  bool hasPresId() => _presId != null;

  void _initializeFields() {
    _petId = snapshotData['petId'] as String?;
    _ownerId = snapshotData['ownerId'] as String?;
    _petName = snapshotData['petName'] as String?;
    _weight = snapshotData['weight'] as String?;
    _gender = snapshotData['gender'] as String?;
    _breed = snapshotData['breed'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _imagepath = snapshotData['imagepath'] as String?;
    _ownerName = snapshotData['ownerName'] as String?;
    _phoneNum = snapshotData['phoneNum'] as String?;
    _presId = snapshotData['presId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pet');

  static Stream<PetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PetRecord.fromSnapshot(s));

  static Future<PetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PetRecord.fromSnapshot(s));

  static PetRecord fromSnapshot(DocumentSnapshot snapshot) => PetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPetRecordData({
  String? petId,
  String? ownerId,
  String? petName,
  String? weight,
  String? gender,
  String? breed,
  int? age,
  String? imagepath,
  String? ownerName,
  String? phoneNum,
  String? presId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'petId': petId,
      'ownerId': ownerId,
      'petName': petName,
      'weight': weight,
      'gender': gender,
      'breed': breed,
      'age': age,
      'imagepath': imagepath,
      'ownerName': ownerName,
      'phoneNum': phoneNum,
      'presId': presId,
    }.withoutNulls,
  );

  return firestoreData;
}

class PetRecordDocumentEquality implements Equality<PetRecord> {
  const PetRecordDocumentEquality();

  @override
  bool equals(PetRecord? e1, PetRecord? e2) {
    return e1?.petId == e2?.petId &&
        e1?.ownerId == e2?.ownerId &&
        e1?.petName == e2?.petName &&
        e1?.weight == e2?.weight &&
        e1?.gender == e2?.gender &&
        e1?.breed == e2?.breed &&
        e1?.age == e2?.age &&
        e1?.imagepath == e2?.imagepath &&
        e1?.ownerName == e2?.ownerName &&
        e1?.phoneNum == e2?.phoneNum &&
        e1?.presId == e2?.presId;
  }

  @override
  int hash(PetRecord? e) => const ListEquality().hash([
        e?.petId,
        e?.ownerId,
        e?.petName,
        e?.weight,
        e?.gender,
        e?.breed,
        e?.age,
        e?.imagepath,
        e?.ownerName,
        e?.phoneNum,
        e?.presId
      ]);

  @override
  bool isValidKey(Object? o) => o is PetRecord;
}
