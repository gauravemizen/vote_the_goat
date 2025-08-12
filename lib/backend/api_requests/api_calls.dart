import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start auth Group Code

class AuthGroup {
  static String getBaseUrl() => 'https://votethegoat.ezxdemo.com/api';
  static Map<String, String> headers = {};
  static LogInCall logInCall = LogInCall();
  static SignUpCall signUpCall = SignUpCall();
  static OtpVerifyCall otpVerifyCall = OtpVerifyCall();
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
  static ForgotOtpVerifyCall forgotOtpVerifyCall = ForgotOtpVerifyCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static ChangePasswordCall changePasswordCall = ChangePasswordCall();
  static LogOutCall logOutCall = LogOutCall();
}

class LogInCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'logIn',
      apiUrl: '${baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SignUpCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? passwordConfirmation = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}",
  "password_confirmation": "${escapeStringForJson(passwordConfirmation)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'signUp',
      apiUrl: '${baseUrl}/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OtpVerifyCall {
  Future<ApiCallResponse> call({
    String? email = '',
    int? otp,
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "otp": ${otp}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'otpVerify',
      apiUrl: '${baseUrl}/verify-email',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
"email":"${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'forgotPassword',
      apiUrl: '${baseUrl}/forgot_password',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ForgotOtpVerifyCall {
  Future<ApiCallResponse> call({
    int? otp,
    int? userId,
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "otp": ${otp},
  "user_id": ${userId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'forgotOtpVerify',
      apiUrl: '${baseUrl}/reset_password_verify',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    int? otp,
    int? userId,
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "otp": ${userId},
  "user_id": ${otp}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resetPassword',
      apiUrl: '${baseUrl}/reset_password_verify',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangePasswordCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? password = '',
    String? passwordConfirmation = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": ${userId},
  "password_confirmation": "${escapeStringForJson(passwordConfirmation)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changePassword',
      apiUrl: '${baseUrl}/reset_password',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LogOutCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'logOut',
      apiUrl: '${baseUrl}/logout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer {{auth_token}}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End auth Group Code

/// Start dashboard Group Code

class DashboardGroup {
  static String getBaseUrl({
    String? authToken,
  }) {
    authToken ??= '';
    return 'https://votethegoat.ezxdemo.com/api';
  }

  static Map<String, String> headers = {};
  static EligblePlayersCall eligblePlayersCall = EligblePlayersCall();
  static AboutPageContentCall aboutPageContentCall = AboutPageContentCall();
  static PlayertBioCall playertBioCall = PlayertBioCall();
  static LogoutCall logoutCall = LogoutCall();
  static ContactSupportCall contactSupportCall = ContactSupportCall();
  static PrivacypolicyCall privacypolicyCall = PrivacypolicyCall();
  static GetProfileCall getProfileCall = GetProfileCall();
  static UpdateProfileCall updateProfileCall = UpdateProfileCall();
  static ResetPassCall resetPassCall = ResetPassCall();
  static FilterListCall filterListCall = FilterListCall();
  static CreateTeamCall createTeamCall = CreateTeamCall();
  static GetAllPlayersCall getAllPlayersCall = GetAllPlayersCall();
  static PositionlistCall positionlistCall = PositionlistCall();
  static RankingPostCall rankingPostCall = RankingPostCall();
}

class EligblePlayersCall {
  Future<ApiCallResponse> call({
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'eligblePlayers',
      apiUrl: '${baseUrl}/eligblePlayers',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? playerList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class AboutPageContentCall {
  Future<ApiCallResponse> call({
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'aboutPageContent',
      apiUrl: '${baseUrl}/about_vote_goat',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? contentList(dynamic response) => getJsonField(
        response,
        r'''$.chapters''',
        true,
      ) as List?;
}

class PlayertBioCall {
  Future<ApiCallResponse> call({
    int? playerId,
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "player_id": ${playerId} 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'playertBio',
      apiUrl: '${baseUrl}/playerBio',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic playerData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'logout',
      apiUrl: '${baseUrl}/logout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ContactSupportCall {
  Future<ApiCallResponse> call({
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'contactSupport',
      apiUrl: '${baseUrl}/cms-pages/contact-support',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic cms(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class PrivacypolicyCall {
  Future<ApiCallResponse> call({
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'privacypolicy',
      apiUrl: '${baseUrl}/cms-pages/privacy-policy',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic privacyPolicy(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class GetProfileCall {
  Future<ApiCallResponse> call({
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getProfile',
      apiUrl: '${baseUrl}/get_Profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic profileDetail(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class UpdateProfileCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateProfile',
      apiUrl: '${baseUrl}/updateProfile',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ResetPassCall {
  Future<ApiCallResponse> call({
    String? currentPassword = '',
    String? newPassword = '',
    String? confirmPassword = '',
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "current_password": "${escapeStringForJson(currentPassword)}",
  "new_password": "${escapeStringForJson(newPassword)}",
  "confirm_password": "${escapeStringForJson(confirmPassword)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resetPass',
      apiUrl: '${baseUrl}/change_password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FilterListCall {
  Future<ApiCallResponse> call({
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'filterList',
      apiUrl: '${baseUrl}/player-filters',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? filter(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class CreateTeamCall {
  Future<ApiCallResponse> call({
    String? title = '',
    FFUploadedFile? logo,
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'createTeam',
      apiUrl: '${baseUrl}/create_teamwork',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'logo': logo,
        'title': title,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllPlayersCall {
  Future<ApiCallResponse> call({
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getAllPlayers',
      apiUrl: '${baseUrl}/player_list',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? playerData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class PositionlistCall {
  Future<ApiCallResponse> call({
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'positionlist',
      apiUrl: '${baseUrl}/position_list',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? positionList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class RankingPostCall {
  Future<ApiCallResponse> call({
    int? playerId,
    int? position,
    String? authToken,
  }) async {
    authToken ??= '';
    final baseUrl = DashboardGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "player_id": ${playerId},
  "position": ${position}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rankingPost',
      apiUrl: '${baseUrl}/rankingPost',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End dashboard Group Code

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

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
