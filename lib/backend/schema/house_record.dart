import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HouseRecord extends FirestoreRecord {
  HouseRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "userDocumentReference" field.
  DocumentReference? _userDocumentReference;
  DocumentReference? get userDocumentReference => _userDocumentReference;
  bool hasUserDocumentReference() => _userDocumentReference != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "photoUrls" field.
  List<String>? _photoUrls;
  List<String> get photoUrls => _photoUrls ?? const [];
  bool hasPhotoUrls() => _photoUrls != null;

  // "hasPhoto" field.
  bool? _hasPhoto;
  bool get hasPhoto => _hasPhoto ?? false;
  bool hasHasPhoto() => _hasPhoto != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "latLng" field.
  LatLng? _latLng;
  LatLng? get latLng => _latLng;
  bool hasLatLng() => _latLng != null;

  // "noOfComments" field.
  int? _noOfComments;
  int get noOfComments => _noOfComments ?? 0;
  bool hasNoOfComments() => _noOfComments != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "maxUsers" field.
  int? _maxUsers;
  int get maxUsers => _maxUsers ?? 0;
  bool hasMaxUsers() => _maxUsers != null;

  // "noOfRooms" field.
  int? _noOfRooms;
  int get noOfRooms => _noOfRooms ?? 0;
  bool hasNoOfRooms() => _noOfRooms != null;

  // "noOfBeds" field.
  int? _noOfBeds;
  int get noOfBeds => _noOfBeds ?? 0;
  bool hasNoOfBeds() => _noOfBeds != null;

  // "noOfBathrooms" field.
  int? _noOfBathrooms;
  int get noOfBathrooms => _noOfBathrooms ?? 0;
  bool hasNoOfBathrooms() => _noOfBathrooms != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "siNm" field.
  String? _siNm;
  String get siNm => _siNm ?? '';
  bool hasSiNm() => _siNm != null;

  // "sggNm" field.
  String? _sggNm;
  String get sggNm => _sggNm ?? '';
  bool hasSggNm() => _sggNm != null;

  // "siNmSggNm" field.
  String? _siNmSggNm;
  String get siNmSggNm => _siNmSggNm ?? '';
  bool hasSiNmSggNm() => _siNmSggNm != null;

  // "roadAddr" field.
  String? _roadAddr;
  String get roadAddr => _roadAddr ?? '';
  bool hasRoadAddr() => _roadAddr != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _price = castToType<int>(snapshotData['price']);
    _userDocumentReference =
        snapshotData['userDocumentReference'] as DocumentReference?;
    _category = snapshotData['category'] as String?;
    _photoUrls = getDataList(snapshotData['photoUrls']);
    _hasPhoto = snapshotData['hasPhoto'] as bool?;
    _subject = snapshotData['subject'] as String?;
    _latLng = snapshotData['latLng'] as LatLng?;
    _noOfComments = castToType<int>(snapshotData['noOfComments']);
    _rating = castToType<double>(snapshotData['rating']);
    _maxUsers = castToType<int>(snapshotData['maxUsers']);
    _noOfRooms = castToType<int>(snapshotData['noOfRooms']);
    _noOfBeds = castToType<int>(snapshotData['noOfBeds']);
    _noOfBathrooms = castToType<int>(snapshotData['noOfBathrooms']);
    _name = snapshotData['name'] as String?;
    _siNm = snapshotData['siNm'] as String?;
    _sggNm = snapshotData['sggNm'] as String?;
    _siNmSggNm = snapshotData['siNmSggNm'] as String?;
    _roadAddr = snapshotData['roadAddr'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('house');

  static Stream<HouseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HouseRecord.fromSnapshot(s));

  static Future<HouseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HouseRecord.fromSnapshot(s));

  static HouseRecord fromSnapshot(DocumentSnapshot snapshot) => HouseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HouseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HouseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HouseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HouseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHouseRecordData({
  DateTime? createdTime,
  int? price,
  DocumentReference? userDocumentReference,
  String? category,
  bool? hasPhoto,
  String? subject,
  LatLng? latLng,
  int? noOfComments,
  double? rating,
  int? maxUsers,
  int? noOfRooms,
  int? noOfBeds,
  int? noOfBathrooms,
  String? name,
  String? siNm,
  String? sggNm,
  String? siNmSggNm,
  String? roadAddr,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'price': price,
      'userDocumentReference': userDocumentReference,
      'category': category,
      'hasPhoto': hasPhoto,
      'subject': subject,
      'latLng': latLng,
      'noOfComments': noOfComments,
      'rating': rating,
      'maxUsers': maxUsers,
      'noOfRooms': noOfRooms,
      'noOfBeds': noOfBeds,
      'noOfBathrooms': noOfBathrooms,
      'name': name,
      'siNm': siNm,
      'sggNm': sggNm,
      'siNmSggNm': siNmSggNm,
      'roadAddr': roadAddr,
    }.withoutNulls,
  );

  return firestoreData;
}

class HouseRecordDocumentEquality implements Equality<HouseRecord> {
  const HouseRecordDocumentEquality();

  @override
  bool equals(HouseRecord? e1, HouseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.price == e2?.price &&
        e1?.userDocumentReference == e2?.userDocumentReference &&
        e1?.category == e2?.category &&
        listEquality.equals(e1?.photoUrls, e2?.photoUrls) &&
        e1?.hasPhoto == e2?.hasPhoto &&
        e1?.subject == e2?.subject &&
        e1?.latLng == e2?.latLng &&
        e1?.noOfComments == e2?.noOfComments &&
        e1?.rating == e2?.rating &&
        e1?.maxUsers == e2?.maxUsers &&
        e1?.noOfRooms == e2?.noOfRooms &&
        e1?.noOfBeds == e2?.noOfBeds &&
        e1?.noOfBathrooms == e2?.noOfBathrooms &&
        e1?.name == e2?.name &&
        e1?.siNm == e2?.siNm &&
        e1?.sggNm == e2?.sggNm &&
        e1?.siNmSggNm == e2?.siNmSggNm &&
        e1?.roadAddr == e2?.roadAddr;
  }

  @override
  int hash(HouseRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.likes,
        e?.price,
        e?.userDocumentReference,
        e?.category,
        e?.photoUrls,
        e?.hasPhoto,
        e?.subject,
        e?.latLng,
        e?.noOfComments,
        e?.rating,
        e?.maxUsers,
        e?.noOfRooms,
        e?.noOfBeds,
        e?.noOfBathrooms,
        e?.name,
        e?.siNm,
        e?.sggNm,
        e?.siNmSggNm,
        e?.roadAddr
      ]);

  @override
  bool isValidKey(Object? o) => o is HouseRecord;
}
