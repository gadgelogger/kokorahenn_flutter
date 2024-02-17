// Dart imports:

// Package imports:
import 'package:dio/dio.dart';
// Project imports:
import 'package:kokorahenn_flutter/api/client/app_dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

String apiKey = 'fbf9b9be8fecf32a';

@RestApi(baseUrl: 'http://webservice.recruit.co.jp/hotpepper/gourmet/v1')
abstract class HotpepperApiClient {
  factory HotpepperApiClient(AppDio dio, {String? baseUrl}) =
      _HotpepperApiClient;

  @GET('')
  Future<String> fetchHotpepperInfo({
    @Query('key') required String apiKey,
    @Query('format') required String format,
    @Query('lat') required double latitude,
    @Query('lng') required double longitude,
    @Query('range') required int range,
  });
}
