import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AsistenIkanPrediksiPenyakitCall {
  static Future<ApiCallResponse> call({
    String? image = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Asisten Ikan Prediksi Penyakit',
      apiUrl:
          'https://classify.roboflow.com/fish-disease-jlp3b/1?api_key=IBaUdJ7MXMaAhUfyivY2',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': image,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PenyakitCall {
  static Future<ApiCallResponse> call({
    String? url = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Penyakit',
      apiUrl: 'https://ai.digisam.id',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'url': url,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MqttCall {
  static Future<ApiCallResponse> call({
    int? pesan,
    String? topik = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'MQTT',
      apiUrl: 'https://ai.digisam.id/mqtt/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'pesan': pesan,
        'topik': topik,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
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
