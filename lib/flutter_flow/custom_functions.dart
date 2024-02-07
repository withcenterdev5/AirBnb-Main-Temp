import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

LatLng getLatLng(
  String lat,
  String lng,
) {
  // Return LatLng from the input parameters of lat and lng. Return Seoul if the inputs are empty
  if (lat.isEmpty || lng.isEmpty) {
    return const LatLng(37.5665, 126.9780); // Return Seoul
  } else {
    final double latitude = double.parse(lat);
    final double longitude = double.parse(lng);
    return LatLng(latitude, longitude);
  }
}

String getLat(LatLng? latLng) {
  // Return latitude in String from the latLng parameter. Return emtpy string for default.
  if (latLng != null) {
    return latLng.latitude.toString();
  } else {
    return '';
  }
}

String getLng(LatLng? latLng) {
  // Return longitude in String
// Return longitude in String from the latLng parameter. Return empty string for default.
  if (latLng != null) {
    return latLng.longitude.toString();
  } else {
    return '';
  }
}

String getCommentSortString(
  int depth,
  int? noOfComments,
  String? sortString,
) {
  /// 맨 첫 번째 코멘트란, 글에 최초로 작성되는 코멘트. 1번째 코멘트. 해당 글에 하나 뿐이다.
  /// 첫번째 레벨 코멘트란, 글 바로 아래에 작성되는 코멘트로, 부모 코멘트가 없는 코멘트이다. 이 경우 depth=0 이다.
  ///
  /// [noOfComments] 는 글의 noOfComments 를 그대로 입력하면 된다.
  /// 참고, 맨 첫번째 코멘트를 작성할 때는 noOfComments 값을 그냥 0의 값(또는 NULL)을 입력하면 된다.
  ///
  /// [sortString] 는 부모 코멘트의 sortString 을 그 대로 입력하면 된다. 첫번째 레벨 코멘트의 경우, 빈 NULL (또는 빈문자열)을 입력하면 된다.
  ///
  /// [depth] 는 부모 코멘트의 depth 이다. depth 를 부모의 것을 그대로 입력하면 된다.
  /// 함수로 전달하기 전에 +1 을 할 필요 없다. 왜냐하면, 첫번째 레벨 코멘트는 [sortString] 이 빈문자열이어서, [depth] 값 자체가 필요없다.
  /// [sortString] 값이 있다는 것은, 첫 번째 레벨 코멘트가 아니라는 뜻이고, [depth]에 1 이상의 값이 들어가 있다는 뜻이다.
  ///
  /// 참고, 코멘트를 저장 할 때에는 [depth] 에 +1 을 해서 저장해야 한다. 첫번째 레벨의 경우, 기본값 1로 저장.
  /// 즉, 모든 코멘트에는 (첫 번째 레벨 코멘트라도) depth 필드에 1 이상의 값을 가진다.
  /// 코멘트 생성시 [sortString] 과 [depth] 지정 예제)
  /// ```dart
  /// FirebaseFirestore.instance.collection('comments').add({
  ///     'sortString': getCommentSortString(noOfComments: post.noOfComments, depth: parent?.depth ?? 0, sortString: parentComment?.sort),
  ///     'depth': parent == null ? 1 : parent.depth + 1,
  /// });
  /// ```
  ///
  /// [maxDepth] 코멘트 레벨 최대 깊이
  const int maxDepth = 9;
  noOfComments ??= 0;
  sortString ??= "";
  if (sortString == "") {
    final firstPart = 100000 + noOfComments;
    return '$firstPart.100000.100000.100000.100000.100000.100000.100000.100000.100000';
  } else {
    if (depth > maxDepth) depth = maxDepth;
    List<String> parts = sortString.split('.');
    String block = parts[depth];
    int computed =
        int.parse(block) + noOfComments + 1; // 처음이 0일 수 있다. 0이면, 부모와 같아서 안됨.
    parts[depth] = computed.toString();
    sortString = parts.join('.');
    return sortString;
  }
}

double indent(int? no) {
  if (no == null) return 0;
  if (no == 0 || no == 1) {
    return 0;
  } else if (no == 2) {
    return 32;
  } else if (no == 3) {
    return 64;
  } else if (no == 4) {
    return 80;
  } else if (no == 5) {
    return 96;
  } else if (no == 6) {
    return 106;
  } else {
    return 112;
  }
}

List<String> getSiGunList() {
  return [
    '가평군',
    '강릉시',
    '강진군',
    '거제시',
    '거창군',
    '경산시',
    '경주시',
    '계룡시',
    '고령군',
    '고성군',
    '고성군',
    '고양시',
    '고창군',
    '고흥군',
    '곡성군',
    '공주시',
    '과천시',
    '광명시',
    '광양시',
    '광주광역시',
    '광주시',
    '괴산군',
    '구례군',
    '구리시',
    '구미시',
    '군산시',
    '군포시',
    '금산군',
    '김제시',
    '김천시',
    '김포시',
    '김해시',
    '나주시',
    '남양주시',
    '남원시',
    '남해군',
    '논산시',
    '단양군',
    '담양군',
    '당진시',
    '대구광역시',
    '대전광역시',
    '동두천시',
    '동해시',
    '목포시',
    '무안군',
    '무주군',
    '문경시',
    '밀양시',
    '보령시',
    '보성군',
    '보은군',
    '봉화군',
    '부산광역시',
    '부안군',
    '부여군',
    '부천시',
    '사천시',
    '산청군',
    '삼척시',
    '상주시',
    '서귀포시',
    '서산시',
    '서울특별시',
    '서천군',
    '성남시',
    '성주군',
    '세종특별자치시',
    '속초시',
    '수원시',
    '순창군',
    '순천시',
    '시흥시',
    '신안군',
    '아산시',
    '안동시',
    '안산시',
    '안성시',
    '안양시',
    '양구군',
    '양산시',
    '양양군',
    '양주시',
    '양평군',
    '여수시',
    '여주시',
    '연천군',
    '영광군',
    '영덕군',
    '영동군',
    '영암군',
    '영양군',
    '영월군',
    '영주시',
    '영천시',
    '예산군',
    '예천군',
    '오산시',
    '옥천군',
    '완도군',
    '완주군',
    '용인시',
    '울릉군',
    '울산광역시',
    '울진군',
    '원주시',
    '음성군',
    '의령군',
    '의성군',
    '의왕시',
    '의정부시',
    '이천시',
    '익산시',
    '인제군',
    '인천광역시',
    '임실군',
    '장성군',
    '장수군',
    '장흥군',
    '전주시',
    '정선군',
    '정읍시',
    '제주시',
    '제천시',
    '증평군',
    '진도군',
    '진안군',
    '진주시',
    '진천군',
    '창녕군',
    '창원시',
    '천안시',
    '철원군',
    '청도군',
    '청송군',
    '청양군',
    '청주시',
    '춘천시',
    '충주시',
    '칠곡군',
    '태백시',
    '태안군',
    '통영시',
    '파주시',
    '평창군',
    '평택시',
    '포천시',
    '포항시',
    '하남시',
    '하동군',
    '함안군',
    '함양군',
    '함평군',
    '합천군',
    '해남군',
    '홍성군',
    '홍천군',
    '화성시',
    '화순군',
    '화천군',
    '횡성군'
  ];
}

List<String> getGuList() {
  return [
    '강남구',
    '강동구',
    '강북구',
    '강서구',
    '계양구',
    '관악구',
    '광산구',
    '광진구',
    '구로구',
    '금정구',
    '금천구',
    '남구',
    '남동구',
    '노원구',
    '달서구',
    '대덕구',
    '도봉구',
    '동구',
    '동대문구',
    '동래구',
    '동작구',
    '마포구',
    '미추홀구',
    '부산진구',
    '부평구',
    '북구',
    '사상구',
    '사하구',
    '서구',
    '서대문구',
    '서초구',
    '성동구',
    '성북구',
    '송파구',
    '수성구',
    '수영구',
    '양천구',
    '연수구',
    '연제구',
    '영도구',
    '영등포구',
    '용산구',
    '유성구',
    '은평구',
    '종로구',
    '중구',
    '중랑구',
    '해운대구'
  ];
}

int getPrice(
  int price,
  DateTime checkInDate,
  DateTime checkOutDate,
) {
  // Return price of the nights between checkInDate and checkOutDate
  final nights = checkOutDate.difference(checkInDate).inDays;
  return price * nights;
}
