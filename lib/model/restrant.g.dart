// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restrant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      tel: json['tel'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      genre: json['genre'] as String?,
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'tel': instance.tel,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'genre': instance.genre,
    };
