import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userDocumentReference" field.
  DocumentReference? _userDocumentReference;
  DocumentReference? get userDocumentReference => _userDocumentReference;
  bool hasUserDocumentReference() => _userDocumentReference != null;

  // "houseDocumentReference" field.
  DocumentReference? _houseDocumentReference;
  DocumentReference? get houseDocumentReference => _houseDocumentReference;
  bool hasHouseDocumentReference() => _houseDocumentReference != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "photoUrls" field.
  List<String>? _photoUrls;
  List<String> get photoUrls => _photoUrls ?? const [];
  bool hasPhotoUrls() => _photoUrls != null;

  // "depth" field.
  int? _depth;
  int get depth => _depth ?? 0;
  bool hasDepth() => _depth != null;

  // "sortString" field.
  String? _sortString;
  String get sortString => _sortString ?? '';
  bool hasSortString() => _sortString != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _userDocumentReference =
        snapshotData['userDocumentReference'] as DocumentReference?;
    _houseDocumentReference =
        snapshotData['houseDocumentReference'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _content = snapshotData['content'] as String?;
    _photoUrls = getDataList(snapshotData['photoUrls']);
    _depth = castToType<int>(snapshotData['depth']);
    _sortString = snapshotData['sortString'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? userDocumentReference,
  DocumentReference? houseDocumentReference,
  DateTime? createdTime,
  String? content,
  int? depth,
  String? sortString,
  int? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userDocumentReference': userDocumentReference,
      'houseDocumentReference': houseDocumentReference,
      'created_time': createdTime,
      'content': content,
      'depth': depth,
      'sortString': sortString,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userDocumentReference == e2?.userDocumentReference &&
        e1?.houseDocumentReference == e2?.houseDocumentReference &&
        e1?.createdTime == e2?.createdTime &&
        e1?.content == e2?.content &&
        listEquality.equals(e1?.photoUrls, e2?.photoUrls) &&
        e1?.depth == e2?.depth &&
        e1?.sortString == e2?.sortString &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.userDocumentReference,
        e?.houseDocumentReference,
        e?.createdTime,
        e?.content,
        e?.photoUrls,
        e?.depth,
        e?.sortString,
        e?.rating
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
