import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetSiDoCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetSiDo',
      apiUrl:
          'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  static List? reg(dynamic response) => getJsonField(
        response,
        r'''$.regcodes''',
        true,
      ) as List?;
  static List? code(dynamic response) => getJsonField(
        response,
        r'''$.regcodes[:].code''',
        true,
      ) as List?;
  static List? name(dynamic response) => getJsonField(
        response,
        r'''$.regcodes[:].name''',
        true,
      ) as List?;
}

class GetSiGunGuCall {
  static Future<ApiCallResponse> call({
    String? code = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetSiGunGu',
      apiUrl: 'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'regcode_pattern': code,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? reg(dynamic response) => getJsonField(
        response,
        r'''$.regcodes''',
        true,
      ) as List?;
  static List? code(dynamic response) => getJsonField(
        response,
        r'''$.regcodes[:].code''',
        true,
      ) as List?;
  static List? name(dynamic response) => getJsonField(
        response,
        r'''$.regcodes[:].name''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
