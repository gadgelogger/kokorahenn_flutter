// Dart imports:

// Package imports:

// Package imports:
import 'package:retrofit/retrofit.dart';

// Project imports:
import 'app_dio.dart';

// Project imports:

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
