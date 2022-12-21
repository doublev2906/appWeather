// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainPageSate {
  int get index => throw _privateConstructorUsedError;
  List<CityModel> get cities => throw _privateConstructorUsedError;
  bool get showIndicator => throw _privateConstructorUsedError;
  bool get isDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainPageSateCopyWith<MainPageSate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainPageSateCopyWith<$Res> {
  factory $MainPageSateCopyWith(
          MainPageSate value, $Res Function(MainPageSate) then) =
      _$MainPageSateCopyWithImpl<$Res>;
  $Res call(
      {int index, List<CityModel> cities, bool showIndicator, bool isDay});
}

/// @nodoc
class _$MainPageSateCopyWithImpl<$Res> implements $MainPageSateCopyWith<$Res> {
  _$MainPageSateCopyWithImpl(this._value, this._then);

  final MainPageSate _value;
  // ignore: unused_field
  final $Res Function(MainPageSate) _then;

  @override
  $Res call({
    Object? index = freezed,
    Object? cities = freezed,
    Object? showIndicator = freezed,
    Object? isDay = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      cities: cities == freezed
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
      showIndicator: showIndicator == freezed
          ? _value.showIndicator
          : showIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      isDay: isDay == freezed
          ? _value.isDay
          : isDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_MainPageSateCopyWith<$Res>
    implements $MainPageSateCopyWith<$Res> {
  factory _$$_MainPageSateCopyWith(
          _$_MainPageSate value, $Res Function(_$_MainPageSate) then) =
      __$$_MainPageSateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int index, List<CityModel> cities, bool showIndicator, bool isDay});
}

/// @nodoc
class __$$_MainPageSateCopyWithImpl<$Res>
    extends _$MainPageSateCopyWithImpl<$Res>
    implements _$$_MainPageSateCopyWith<$Res> {
  __$$_MainPageSateCopyWithImpl(
      _$_MainPageSate _value, $Res Function(_$_MainPageSate) _then)
      : super(_value, (v) => _then(v as _$_MainPageSate));

  @override
  _$_MainPageSate get _value => super._value as _$_MainPageSate;

  @override
  $Res call({
    Object? index = freezed,
    Object? cities = freezed,
    Object? showIndicator = freezed,
    Object? isDay = freezed,
  }) {
    return _then(_$_MainPageSate(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      cities: cities == freezed
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
      showIndicator: showIndicator == freezed
          ? _value.showIndicator
          : showIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      isDay: isDay == freezed
          ? _value.isDay
          : isDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MainPageSate implements _MainPageSate {
  _$_MainPageSate(
      {this.index = 0,
      final List<CityModel> cities = const [],
      this.showIndicator = false,
      this.isDay = false})
      : _cities = cities;

  @override
  @JsonKey()
  final int index;
  final List<CityModel> _cities;
  @override
  @JsonKey()
  List<CityModel> get cities {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  @override
  @JsonKey()
  final bool showIndicator;
  @override
  @JsonKey()
  final bool isDay;

  @override
  String toString() {
    return 'MainPageSate(index: $index, cities: $cities, showIndicator: $showIndicator, isDay: $isDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainPageSate &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            const DeepCollectionEquality()
                .equals(other.showIndicator, showIndicator) &&
            const DeepCollectionEquality().equals(other.isDay, isDay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(_cities),
      const DeepCollectionEquality().hash(showIndicator),
      const DeepCollectionEquality().hash(isDay));

  @JsonKey(ignore: true)
  @override
  _$$_MainPageSateCopyWith<_$_MainPageSate> get copyWith =>
      __$$_MainPageSateCopyWithImpl<_$_MainPageSate>(this, _$identity);
}

abstract class _MainPageSate implements MainPageSate {
  factory _MainPageSate(
      {final int index,
      final List<CityModel> cities,
      final bool showIndicator,
      final bool isDay}) = _$_MainPageSate;

  @override
  int get index;
  @override
  List<CityModel> get cities;
  @override
  bool get showIndicator;
  @override
  bool get isDay;
  @override
  @JsonKey(ignore: true)
  _$$_MainPageSateCopyWith<_$_MainPageSate> get copyWith =>
      throw _privateConstructorUsedError;
}
