// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopImpl _$$ShopImplFromJson(Map<String, dynamic> json) => _$ShopImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      logo_image: json['logo_image'] as String?,
      name_kana: json['name_kana'] as String?,
      address: json['address'] as String?,
      station_name: json['station_name'] as String?,
      ktai_coupon: json['ktai_coupon'] as int?,
      large_service_area: json['large_service_area'] == null
          ? null
          : Area.fromJson(json['large_service_area'] as Map<String, dynamic>),
      service_area: json['service_area'] == null
          ? null
          : Area.fromJson(json['service_area'] as Map<String, dynamic>),
      large_area: json['large_area'] == null
          ? null
          : Area.fromJson(json['large_area'] as Map<String, dynamic>),
      middle_area: json['middle_area'] == null
          ? null
          : Area.fromJson(json['middle_area'] as Map<String, dynamic>),
      small_area: json['small_area'] == null
          ? null
          : Area.fromJson(json['small_area'] as Map<String, dynamic>),
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      genre: json['genre'] == null
          ? null
          : Genre.fromJson(json['genre'] as Map<String, dynamic>),
      sub_genre: json['sub_genre'] == null
          ? null
          : Genre.fromJson(json['sub_genre'] as Map<String, dynamic>),
      budget: json['budget'] == null
          ? null
          : Budget.fromJson(json['budget'] as Map<String, dynamic>),
      capacity: json['capacity'] as int?,
      access: json['access'] as String?,
      mobile_access: json['mobile_access'] as String?,
      urls: json['urls'] == null
          ? null
          : Urls.fromJson(json['urls'] as Map<String, dynamic>),
      photo: json['photo'] == null
          ? null
          : Photo.fromJson(json['photo'] as Map<String, dynamic>),
      open: json['open'] as String?,
      close: json['close'] as String?,
      party_capacity: json['party_capacity'] as int?,
      other_memo: json['other_memo'] as String?,
      shop_detail_memo: json['shop_detail_memo'] as String?,
      budget_memo: json['budget_memo'] as String?,
      wedding: json['wedding'] as String?,
      course: json['course'] as String?,
      free_drink: json['free_drink'] as String?,
      free_food: json['free_food'] as String?,
      private_room: json['private_room'] as String?,
      horigotatsu: json['horigotatsu'] as String?,
      tatami: json['tatami'] as String?,
      card: json['card'] as String?,
      non_smoking: json['non_smoking'] as String?,
      charter: json['charter'] as String?,
      parking: json['parking'] as String?,
      barrier_free: json['barrier_free'] as String?,
      show: json['show'] as String?,
      karaoke: json['karaoke'] as String?,
      band: json['band'] as String?,
      tv: json['tv'] as String?,
      lunch: json['lunch'] as String?,
      midnight: json['midnight'] as String?,
      english: json['english'] as String?,
      pet: json['pet'] as String?,
      child: json['child'] as String?,
      wifi: json['wifi'] as String?,
      coupon_urls: json['coupon_urls'] == null
          ? null
          : CouponUrls.fromJson(json['coupon_urls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ShopImplToJson(_$ShopImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_image': instance.logo_image,
      'name_kana': instance.name_kana,
      'address': instance.address,
      'station_name': instance.station_name,
      'ktai_coupon': instance.ktai_coupon,
      'large_service_area': instance.large_service_area?.toJson(),
      'service_area': instance.service_area?.toJson(),
      'large_area': instance.large_area?.toJson(),
      'middle_area': instance.middle_area?.toJson(),
      'small_area': instance.small_area?.toJson(),
      'lat': instance.lat,
      'lng': instance.lng,
      'genre': instance.genre?.toJson(),
      'sub_genre': instance.sub_genre?.toJson(),
      'budget': instance.budget?.toJson(),
      'capacity': instance.capacity,
      'access': instance.access,
      'mobile_access': instance.mobile_access,
      'urls': instance.urls?.toJson(),
      'photo': instance.photo?.toJson(),
      'open': instance.open,
      'close': instance.close,
      'party_capacity': instance.party_capacity,
      'other_memo': instance.other_memo,
      'shop_detail_memo': instance.shop_detail_memo,
      'budget_memo': instance.budget_memo,
      'wedding': instance.wedding,
      'course': instance.course,
      'free_drink': instance.free_drink,
      'free_food': instance.free_food,
      'private_room': instance.private_room,
      'horigotatsu': instance.horigotatsu,
      'tatami': instance.tatami,
      'card': instance.card,
      'non_smoking': instance.non_smoking,
      'charter': instance.charter,
      'parking': instance.parking,
      'barrier_free': instance.barrier_free,
      'show': instance.show,
      'karaoke': instance.karaoke,
      'band': instance.band,
      'tv': instance.tv,
      'lunch': instance.lunch,
      'midnight': instance.midnight,
      'english': instance.english,
      'pet': instance.pet,
      'child': instance.child,
      'wifi': instance.wifi,
      'coupon_urls': instance.coupon_urls?.toJson(),
    };

_$AreaImpl _$$AreaImplFromJson(Map<String, dynamic> json) => _$AreaImpl(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$AreaImplToJson(_$AreaImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

_$GenreImpl _$$GenreImplFromJson(Map<String, dynamic> json) => _$GenreImpl(
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$GenreImplToJson(_$GenreImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$BudgetImpl _$$BudgetImplFromJson(Map<String, dynamic> json) => _$BudgetImpl(
      code: json['code'] as String?,
      name: json['name'] as String?,
      average: json['average'] as String?,
    );

Map<String, dynamic> _$$BudgetImplToJson(_$BudgetImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'average': instance.average,
    };

_$UrlsImpl _$$UrlsImplFromJson(Map<String, dynamic> json) => _$UrlsImpl(
      pc: json['pc'] as String?,
    );

Map<String, dynamic> _$$UrlsImplToJson(_$UrlsImpl instance) =>
    <String, dynamic>{
      'pc': instance.pc,
    };

_$PhotoImpl _$$PhotoImplFromJson(Map<String, dynamic> json) => _$PhotoImpl(
      pc: json['pc'] == null
          ? null
          : Pc.fromJson(json['pc'] as Map<String, dynamic>),
      mobile: json['mobile'] == null
          ? null
          : Mobile.fromJson(json['mobile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PhotoImplToJson(_$PhotoImpl instance) =>
    <String, dynamic>{
      'pc': instance.pc?.toJson(),
      'mobile': instance.mobile?.toJson(),
    };

_$PcImpl _$$PcImplFromJson(Map<String, dynamic> json) => _$PcImpl(
      l: json['l'] as String?,
      m: json['m'] as String?,
      s: json['s'] as String?,
    );

Map<String, dynamic> _$$PcImplToJson(_$PcImpl instance) => <String, dynamic>{
      'l': instance.l,
      'm': instance.m,
      's': instance.s,
    };

_$MobileImpl _$$MobileImplFromJson(Map<String, dynamic> json) => _$MobileImpl(
      l: json['l'] as String?,
      s: json['s'] as String?,
    );

Map<String, dynamic> _$$MobileImplToJson(_$MobileImpl instance) =>
    <String, dynamic>{
      'l': instance.l,
      's': instance.s,
    };

_$CouponUrlsImpl _$$CouponUrlsImplFromJson(Map<String, dynamic> json) =>
    _$CouponUrlsImpl(
      pc: json['pc'] as String?,
      sp: json['sp'] as String?,
    );

Map<String, dynamic> _$$CouponUrlsImplToJson(_$CouponUrlsImpl instance) =>
    <String, dynamic>{
      'pc': instance.pc,
      'sp': instance.sp,
    };
