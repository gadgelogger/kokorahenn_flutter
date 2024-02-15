// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotpepper_gourmet_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HotpepperGourmetResponse _$HotpepperGourmetResponseFromJson(
    Map<String, dynamic> json) {
  return _HotpepperGourmetResponse.fromJson(json);
}

/// @nodoc
mixin _$HotpepperGourmetResponse {
  String get apiVersion => throw _privateConstructorUsedError;
  int get resultsAvailable => throw _privateConstructorUsedError;
  String get resultsReturned => throw _privateConstructorUsedError;
  int get resultsStart => throw _privateConstructorUsedError;
  List<Shop> get shop => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HotpepperGourmetResponseCopyWith<HotpepperGourmetResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotpepperGourmetResponseCopyWith<$Res> {
  factory $HotpepperGourmetResponseCopyWith(HotpepperGourmetResponse value,
          $Res Function(HotpepperGourmetResponse) then) =
      _$HotpepperGourmetResponseCopyWithImpl<$Res, HotpepperGourmetResponse>;
  @useResult
  $Res call(
      {String apiVersion,
      int resultsAvailable,
      String resultsReturned,
      int resultsStart,
      List<Shop> shop});
}

/// @nodoc
class _$HotpepperGourmetResponseCopyWithImpl<$Res,
        $Val extends HotpepperGourmetResponse>
    implements $HotpepperGourmetResponseCopyWith<$Res> {
  _$HotpepperGourmetResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiVersion = null,
    Object? resultsAvailable = null,
    Object? resultsReturned = null,
    Object? resultsStart = null,
    Object? shop = null,
  }) {
    return _then(_value.copyWith(
      apiVersion: null == apiVersion
          ? _value.apiVersion
          : apiVersion // ignore: cast_nullable_to_non_nullable
              as String,
      resultsAvailable: null == resultsAvailable
          ? _value.resultsAvailable
          : resultsAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      resultsReturned: null == resultsReturned
          ? _value.resultsReturned
          : resultsReturned // ignore: cast_nullable_to_non_nullable
              as String,
      resultsStart: null == resultsStart
          ? _value.resultsStart
          : resultsStart // ignore: cast_nullable_to_non_nullable
              as int,
      shop: null == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as List<Shop>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HotpepperGourmetResponseImplCopyWith<$Res>
    implements $HotpepperGourmetResponseCopyWith<$Res> {
  factory _$$HotpepperGourmetResponseImplCopyWith(
          _$HotpepperGourmetResponseImpl value,
          $Res Function(_$HotpepperGourmetResponseImpl) then) =
      __$$HotpepperGourmetResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String apiVersion,
      int resultsAvailable,
      String resultsReturned,
      int resultsStart,
      List<Shop> shop});
}

/// @nodoc
class __$$HotpepperGourmetResponseImplCopyWithImpl<$Res>
    extends _$HotpepperGourmetResponseCopyWithImpl<$Res,
        _$HotpepperGourmetResponseImpl>
    implements _$$HotpepperGourmetResponseImplCopyWith<$Res> {
  __$$HotpepperGourmetResponseImplCopyWithImpl(
      _$HotpepperGourmetResponseImpl _value,
      $Res Function(_$HotpepperGourmetResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiVersion = null,
    Object? resultsAvailable = null,
    Object? resultsReturned = null,
    Object? resultsStart = null,
    Object? shop = null,
  }) {
    return _then(_$HotpepperGourmetResponseImpl(
      apiVersion: null == apiVersion
          ? _value.apiVersion
          : apiVersion // ignore: cast_nullable_to_non_nullable
              as String,
      resultsAvailable: null == resultsAvailable
          ? _value.resultsAvailable
          : resultsAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      resultsReturned: null == resultsReturned
          ? _value.resultsReturned
          : resultsReturned // ignore: cast_nullable_to_non_nullable
              as String,
      resultsStart: null == resultsStart
          ? _value.resultsStart
          : resultsStart // ignore: cast_nullable_to_non_nullable
              as int,
      shop: null == shop
          ? _value._shop
          : shop // ignore: cast_nullable_to_non_nullable
              as List<Shop>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HotpepperGourmetResponseImpl implements _HotpepperGourmetResponse {
  _$HotpepperGourmetResponseImpl(
      {required this.apiVersion,
      required this.resultsAvailable,
      required this.resultsReturned,
      required this.resultsStart,
      required final List<Shop> shop})
      : _shop = shop;

  factory _$HotpepperGourmetResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotpepperGourmetResponseImplFromJson(json);

  @override
  final String apiVersion;
  @override
  final int resultsAvailable;
  @override
  final String resultsReturned;
  @override
  final int resultsStart;
  final List<Shop> _shop;
  @override
  List<Shop> get shop {
    if (_shop is EqualUnmodifiableListView) return _shop;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shop);
  }

  @override
  String toString() {
    return 'HotpepperGourmetResponse(apiVersion: $apiVersion, resultsAvailable: $resultsAvailable, resultsReturned: $resultsReturned, resultsStart: $resultsStart, shop: $shop)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotpepperGourmetResponseImpl &&
            (identical(other.apiVersion, apiVersion) ||
                other.apiVersion == apiVersion) &&
            (identical(other.resultsAvailable, resultsAvailable) ||
                other.resultsAvailable == resultsAvailable) &&
            (identical(other.resultsReturned, resultsReturned) ||
                other.resultsReturned == resultsReturned) &&
            (identical(other.resultsStart, resultsStart) ||
                other.resultsStart == resultsStart) &&
            const DeepCollectionEquality().equals(other._shop, _shop));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      apiVersion,
      resultsAvailable,
      resultsReturned,
      resultsStart,
      const DeepCollectionEquality().hash(_shop));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HotpepperGourmetResponseImplCopyWith<_$HotpepperGourmetResponseImpl>
      get copyWith => __$$HotpepperGourmetResponseImplCopyWithImpl<
          _$HotpepperGourmetResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HotpepperGourmetResponseImplToJson(
      this,
    );
  }
}

abstract class _HotpepperGourmetResponse implements HotpepperGourmetResponse {
  factory _HotpepperGourmetResponse(
      {required final String apiVersion,
      required final int resultsAvailable,
      required final String resultsReturned,
      required final int resultsStart,
      required final List<Shop> shop}) = _$HotpepperGourmetResponseImpl;

  factory _HotpepperGourmetResponse.fromJson(Map<String, dynamic> json) =
      _$HotpepperGourmetResponseImpl.fromJson;

  @override
  String get apiVersion;
  @override
  int get resultsAvailable;
  @override
  String get resultsReturned;
  @override
  int get resultsStart;
  @override
  List<Shop> get shop;
  @override
  @JsonKey(ignore: true)
  _$$HotpepperGourmetResponseImplCopyWith<_$HotpepperGourmetResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
