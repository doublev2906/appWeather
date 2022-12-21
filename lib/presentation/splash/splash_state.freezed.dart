// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashSate {
  CityModel? get currentCity => throw _privateConstructorUsedError;
  bool get navigateToMain => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashSateCopyWith<SplashSate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashSateCopyWith<$Res> {
  factory $SplashSateCopyWith(
          SplashSate value, $Res Function(SplashSate) then) =
      _$SplashSateCopyWithImpl<$Res>;
  $Res call({CityModel? currentCity, bool navigateToMain});
}

/// @nodoc
class _$SplashSateCopyWithImpl<$Res> implements $SplashSateCopyWith<$Res> {
  _$SplashSateCopyWithImpl(this._value, this._then);

  final SplashSate _value;
  // ignore: unused_field
  final $Res Function(SplashSate) _then;

  @override
  $Res call({
    Object? currentCity = freezed,
    Object? navigateToMain = freezed,
  }) {
    return _then(_value.copyWith(
      currentCity: currentCity == freezed
          ? _value.currentCity
          : currentCity // ignore: cast_nullable_to_non_nullable
              as CityModel?,
      navigateToMain: navigateToMain == freezed
          ? _value.navigateToMain
          : navigateToMain // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SplashSateCopyWith<$Res>
    implements $SplashSateCopyWith<$Res> {
  factory _$$_SplashSateCopyWith(
          _$_SplashSate value, $Res Function(_$_SplashSate) then) =
      __$$_SplashSateCopyWithImpl<$Res>;
  @override
  $Res call({CityModel? currentCity, bool navigateToMain});
}

/// @nodoc
class __$$_SplashSateCopyWithImpl<$Res> extends _$SplashSateCopyWithImpl<$Res>
    implements _$$_SplashSateCopyWith<$Res> {
  __$$_SplashSateCopyWithImpl(
      _$_SplashSate _value, $Res Function(_$_SplashSate) _then)
      : super(_value, (v) => _then(v as _$_SplashSate));

  @override
  _$_SplashSate get _value => super._value as _$_SplashSate;

  @override
  $Res call({
    Object? currentCity = freezed,
    Object? navigateToMain = freezed,
  }) {
    return _then(_$_SplashSate(
      currentCity: currentCity == freezed
          ? _value.currentCity
          : currentCity // ignore: cast_nullable_to_non_nullable
              as CityModel?,
      navigateToMain: navigateToMain == freezed
          ? _value.navigateToMain
          : navigateToMain // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SplashSate implements _SplashSate {
  _$_SplashSate({this.currentCity = null, this.navigateToMain = false});

  @override
  @JsonKey()
  final CityModel? currentCity;
  @override
  @JsonKey()
  final bool navigateToMain;

  @override
  String toString() {
    return 'SplashSate(currentCity: $currentCity, navigateToMain: $navigateToMain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SplashSate &&
            const DeepCollectionEquality()
                .equals(other.currentCity, currentCity) &&
            const DeepCollectionEquality()
                .equals(other.navigateToMain, navigateToMain));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentCity),
      const DeepCollectionEquality().hash(navigateToMain));

  @JsonKey(ignore: true)
  @override
  _$$_SplashSateCopyWith<_$_SplashSate> get copyWith =>
      __$$_SplashSateCopyWithImpl<_$_SplashSate>(this, _$identity);
}

abstract class _SplashSate implements SplashSate {
  factory _SplashSate(
      {final CityModel? currentCity,
      final bool navigateToMain}) = _$_SplashSate;

  @override
  CityModel? get currentCity;
  @override
  bool get navigateToMain;
  @override
  @JsonKey(ignore: true)
  _$$_SplashSateCopyWith<_$_SplashSate> get copyWith =>
      throw _privateConstructorUsedError;
}
