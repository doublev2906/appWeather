// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
    required TResult Function(String message) nonePerMission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    TResult Function(String message)? nonePerMission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    TResult Function(String message)? nonePerMission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(HomeStateData value) $default, {
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateError value) error,
    required TResult Function(HomeStateNonePerMission value) nonePerMission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(HomeStateData value)? $default, {
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateNonePerMission value)? nonePerMission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(HomeStateData value)? $default, {
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateNonePerMission value)? nonePerMission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;
}

/// @nodoc
abstract class _$$HomeStateDataCopyWith<$Res> {
  factory _$$HomeStateDataCopyWith(
          _$HomeStateData value, $Res Function(_$HomeStateData) then) =
      __$$HomeStateDataCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> data, Placemark location});
}

/// @nodoc
class __$$HomeStateDataCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$HomeStateDataCopyWith<$Res> {
  __$$HomeStateDataCopyWithImpl(
      _$HomeStateData _value, $Res Function(_$HomeStateData) _then)
      : super(_value, (v) => _then(v as _$HomeStateData));

  @override
  _$HomeStateData get _value => super._value as _$HomeStateData;

  @override
  $Res call({
    Object? data = freezed,
    Object? location = freezed,
  }) {
    return _then(_$HomeStateData(
      data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Placemark,
    ));
  }
}

/// @nodoc

class _$HomeStateData implements HomeStateData {
  const _$HomeStateData(final Map<String, dynamic> data, this.location)
      : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final Placemark location;

  @override
  String toString() {
    return 'HomeState(data: $data, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateData &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$$HomeStateDataCopyWith<_$HomeStateData> get copyWith =>
      __$$HomeStateDataCopyWithImpl<_$HomeStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
    required TResult Function(String message) nonePerMission,
  }) {
    return $default(data, location);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    TResult Function(String message)? nonePerMission,
  }) {
    return $default?.call(data, location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    TResult Function(String message)? nonePerMission,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(data, location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(HomeStateData value) $default, {
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateError value) error,
    required TResult Function(HomeStateNonePerMission value) nonePerMission,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(HomeStateData value)? $default, {
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateNonePerMission value)? nonePerMission,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(HomeStateData value)? $default, {
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateNonePerMission value)? nonePerMission,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class HomeStateData implements HomeState {
  const factory HomeStateData(
          final Map<String, dynamic> data, final Placemark location) =
      _$HomeStateData;

  Map<String, dynamic> get data;
  Placemark get location;
  @JsonKey(ignore: true)
  _$$HomeStateDataCopyWith<_$HomeStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeStateLoadingCopyWith<$Res> {
  factory _$$HomeStateLoadingCopyWith(
          _$HomeStateLoading value, $Res Function(_$HomeStateLoading) then) =
      __$$HomeStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateLoadingCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res>
    implements _$$HomeStateLoadingCopyWith<$Res> {
  __$$HomeStateLoadingCopyWithImpl(
      _$HomeStateLoading _value, $Res Function(_$HomeStateLoading) _then)
      : super(_value, (v) => _then(v as _$HomeStateLoading));

  @override
  _$HomeStateLoading get _value => super._value as _$HomeStateLoading;
}

/// @nodoc

class _$HomeStateLoading implements HomeStateLoading {
  const _$HomeStateLoading();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
    required TResult Function(String message) nonePerMission,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    TResult Function(String message)? nonePerMission,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    TResult Function(String message)? nonePerMission,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(HomeStateData value) $default, {
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateError value) error,
    required TResult Function(HomeStateNonePerMission value) nonePerMission,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(HomeStateData value)? $default, {
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateNonePerMission value)? nonePerMission,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(HomeStateData value)? $default, {
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateNonePerMission value)? nonePerMission,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeStateLoading implements HomeState {
  const factory HomeStateLoading() = _$HomeStateLoading;
}

/// @nodoc
abstract class _$$HomeStateErrorCopyWith<$Res> {
  factory _$$HomeStateErrorCopyWith(
          _$HomeStateError value, $Res Function(_$HomeStateError) then) =
      __$$HomeStateErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class __$$HomeStateErrorCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$HomeStateErrorCopyWith<$Res> {
  __$$HomeStateErrorCopyWithImpl(
      _$HomeStateError _value, $Res Function(_$HomeStateError) _then)
      : super(_value, (v) => _then(v as _$HomeStateError));

  @override
  _$HomeStateError get _value => super._value as _$HomeStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$HomeStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$HomeStateError implements HomeStateError {
  const _$HomeStateError(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'HomeState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$HomeStateErrorCopyWith<_$HomeStateError> get copyWith =>
      __$$HomeStateErrorCopyWithImpl<_$HomeStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
    required TResult Function(String message) nonePerMission,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    TResult Function(String message)? nonePerMission,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    TResult Function(String message)? nonePerMission,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(HomeStateData value) $default, {
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateError value) error,
    required TResult Function(HomeStateNonePerMission value) nonePerMission,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(HomeStateData value)? $default, {
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateNonePerMission value)? nonePerMission,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(HomeStateData value)? $default, {
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateNonePerMission value)? nonePerMission,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomeStateError implements HomeState {
  const factory HomeStateError(final dynamic error) = _$HomeStateError;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$HomeStateErrorCopyWith<_$HomeStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeStateNonePerMissionCopyWith<$Res> {
  factory _$$HomeStateNonePerMissionCopyWith(_$HomeStateNonePerMission value,
          $Res Function(_$HomeStateNonePerMission) then) =
      __$$HomeStateNonePerMissionCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$HomeStateNonePerMissionCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res>
    implements _$$HomeStateNonePerMissionCopyWith<$Res> {
  __$$HomeStateNonePerMissionCopyWithImpl(_$HomeStateNonePerMission _value,
      $Res Function(_$HomeStateNonePerMission) _then)
      : super(_value, (v) => _then(v as _$HomeStateNonePerMission));

  @override
  _$HomeStateNonePerMission get _value =>
      super._value as _$HomeStateNonePerMission;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$HomeStateNonePerMission(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeStateNonePerMission implements HomeStateNonePerMission {
  const _$HomeStateNonePerMission(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'HomeState.nonePerMission(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateNonePerMission &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$HomeStateNonePerMissionCopyWith<_$HomeStateNonePerMission> get copyWith =>
      __$$HomeStateNonePerMissionCopyWithImpl<_$HomeStateNonePerMission>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
    required TResult Function(String message) nonePerMission,
  }) {
    return nonePerMission(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    TResult Function(String message)? nonePerMission,
  }) {
    return nonePerMission?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<String, dynamic> data, Placemark location)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    TResult Function(String message)? nonePerMission,
    required TResult orElse(),
  }) {
    if (nonePerMission != null) {
      return nonePerMission(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(HomeStateData value) $default, {
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateError value) error,
    required TResult Function(HomeStateNonePerMission value) nonePerMission,
  }) {
    return nonePerMission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(HomeStateData value)? $default, {
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateNonePerMission value)? nonePerMission,
  }) {
    return nonePerMission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(HomeStateData value)? $default, {
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateNonePerMission value)? nonePerMission,
    required TResult orElse(),
  }) {
    if (nonePerMission != null) {
      return nonePerMission(this);
    }
    return orElse();
  }
}

abstract class HomeStateNonePerMission implements HomeState {
  const factory HomeStateNonePerMission(final String message) =
      _$HomeStateNonePerMission;

  String get message;
  @JsonKey(ignore: true)
  _$$HomeStateNonePerMissionCopyWith<_$HomeStateNonePerMission> get copyWith =>
      throw _privateConstructorUsedError;
}
