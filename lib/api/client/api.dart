// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import '../../env/env.dart';
import 'app_dio.dart';

part 'api.g.dart';

String apiKey = Env.key;

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
