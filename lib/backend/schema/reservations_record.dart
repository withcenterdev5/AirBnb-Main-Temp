import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservationsRecord extends FirestoreRecord {
  ReservationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userDocumentReference" field.
  DocumentReference? _userDocumentReference;
  DocumentReference? get userDocumentReference => _userDocumentReference;
  bool hasUserDocumentReference() => _userDocumentReference != null;

  // "ownerDocumentReference" field.
  DocumentReference? _ownerDocumentReference;
  DocumentReference? get ownerDocumentReference => _ownerDocumentReference;
  bool hasOwnerDocumentReference() => _ownerDocumentReference != null;

  // "houseDocumentReference" field.
  DocumentReference? _houseDocumentReference;
  DocumentReference? get houseDocumentReference => _houseDocumentReference;
  bool hasHouseDocumentReference() => _houseDocumentReference != null;

  // "checkInDate" field.
  DateTime? _checkInDate;
  DateTime? get checkInDate => _checkInDate;
  bool hasCheckInDate() => _checkInDate != null;

  // "checkOutDate" field.
  DateTime? _checkOutDate;
  DateTime? get checkOutDate => _checkOutDate;
  bool hasCheckOutDate() => _checkOutDate != null;

  // "noOfUsers" field.
  int? _noOfUsers;
  int get noOfUsers => _noOfUsers ?? 0;
  bool hasNoOfUsers() => _noOfUsers != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "hasPaid" field.
  bool? _hasPaid;
  bool get hasPaid => _hasPaid ?? false;
  bool hasHasPaid() => _hasPaid != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "paidDate" field.
  DateTime? _paidDate;
  DateTime? get paidDate => _paidDate;
  bool hasPaidDate() => _paidDate != null;

  void _initializeFields() {
    _userDocumentReference =
        snapshotData['userDocumentReference'] as DocumentReference?;
    _ownerDocumentReference =
        snapshotData['ownerDocumentReference'] as DocumentReference?;
    _houseDocumentReference =
        snapshotData['houseDocumentReference'] as DocumentReference?;
    _checkInDate = snapshotData['checkInDate'] as DateTime?;
    _checkOutDate = snapshotData['checkOutDate'] as DateTime?;
    _noOfUsers = castToType<int>(snapshotData['noOfUsers']);
    _price = castToType<int>(snapshotData['price']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _hasPaid = snapshotData['hasPaid'] as bool?;
    _uid = snapshotData['uid'] as String?;
    _paidDate = snapshotData['paidDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservations');

  static Stream<ReservationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationsRecord.fromSnapshot(s));

  static Future<ReservationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationsRecord.fromSnapshot(s));

  static ReservationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationsRecordData({
  DocumentReference? userDocumentReference,
  DocumentReference? ownerDocumentReference,
  DocumentReference? houseDocumentReference,
  DateTime? checkInDate,
  DateTime? checkOutDate,
  int? noOfUsers,
  int? price,
  DateTime? createdAt,
  bool? hasPaid,
  String? uid,
  DateTime? paidDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userDocumentReference': userDocumentReference,
      'ownerDocumentReference': ownerDocumentReference,
      'houseDocumentReference': houseDocumentReference,
      'checkInDate': checkInDate,
      'checkOutDate': checkOutDate,
      'noOfUsers': noOfUsers,
      'price': price,
      'createdAt': createdAt,
      'hasPaid': hasPaid,
      'uid': uid,
      'paidDate': paidDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationsRecordDocumentEquality
    implements Equality<ReservationsRecord> {
  const ReservationsRecordDocumentEquality();

  @override
  bool equals(ReservationsRecord? e1, ReservationsRecord? e2) {
    return e1?.userDocumentReference == e2?.userDocumentReference &&
        e1?.ownerDocumentReference == e2?.ownerDocumentReference &&
        e1?.houseDocumentReference == e2?.houseDocumentReference &&
        e1?.checkInDate == e2?.checkInDate &&
        e1?.checkOutDate == e2?.checkOutDate &&
        e1?.noOfUsers == e2?.noOfUsers &&
        e1?.price == e2?.price &&
        e1?.createdAt == e2?.createdAt &&
        e1?.hasPaid == e2?.hasPaid &&
        e1?.uid == e2?.uid &&
        e1?.paidDate == e2?.paidDate;
  }

  @override
  int hash(ReservationsRecord? e) => const ListEquality().hash([
        e?.userDocumentReference,
        e?.ownerDocumentReference,
        e?.houseDocumentReference,
        e?.checkInDate,
        e?.checkOutDate,
        e?.noOfUsers,
        e?.price,
        e?.createdAt,
        e?.hasPaid,
        e?.uid,
        e?.paidDate
      ]);

  @override
  bool isValidKey(Object? o) => o is ReservationsRecord;
}
