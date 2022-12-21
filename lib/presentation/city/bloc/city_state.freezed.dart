// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'city_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(CurrentWeatherModel data) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(CurrentWeatherModel data)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(CurrentWeatherModel data)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(CityStateData value) $default, {
    required TResult Function(CityStateLoading value) loading,
    required TResult Function(CityStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(CityStateData value)? $default, {
    TResult Function(CityStateLoading value)? loading,
    TResult Function(CityStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CityStateData value)? $default, {
    TResult Function(CityStateLoading value)? loading,
    TResult Function(CityStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityStateCopyWith<$Res> {
  factory $CityStateCopyWith(CityState value, $Res Function(CityState) then) =
      _$CityStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CityStateCopyWithImpl<$Res> implements $CityStateCopyWith<$Res> {
  _$CityStateCopyWithImpl(this._value, this._then);

  final CityState _value;
  // ignore: unused_field
  final $Res Function(CityState) _then;
}

/// @nodoc
abstract class _$$CityStateDataCopyWith<$Res> {
  factory _$$CityStateDataCopyWith(
          _$CityStateData value, $Res Function(_$CityStateData) then) =
      __$$CityStateDataCopyWithImpl<$Res>;
  $Res call({CurrentWeatherModel data});
}

/// @nodoc
class __$$CityStateDataCopyWithImpl<$Res> extends _$CityStateCopyWithImpl<$Res>
    implements _$$CityStateDataCopyWith<$Res> {
  __$$CityStateDataCopyWithImpl(
      _$CityStateData _value, $Res Function(_$CityStateData) _then)
      : super(_value, (v) => _then(v as _$CityStateData));

  @override
  _$CityStateData get _value => super._value as _$CityStateData;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$CityStateData(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CurrentWeatherModel,
    ));
  }
}

/// @nodoc

class _$CityStateData implements CityStateData {
  const _$CityStateData(this.data);

  @override
  final CurrentWeatherModel data;

  @override
  String toString() {
    return 'CityState(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityStateData &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$CityStateDataCopyWith<_$CityStateData> get copyWith =>
      __$$CityStateDataCopyWithImpl<_$CityStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(CurrentWeatherModel data) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(CurrentWeatherModel data)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return $default?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(CurrentWeatherModel data)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(CityStateData value) $default, {
    required TResult Function(CityStateLoading value) loading,
    required TResult Function(CityStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(CityStateData value)? $default, {
    TResult Function(CityStateLoading value)? loading,
    TResult Function(CityStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CityStateData value)? $default, {
    TResult Function(CityStateLoading value)? loading,
    TResult Function(CityStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class CityStateData implements CityState {
  const factory CityStateData(final CurrentWeatherModel data) = _$CityStateData;

  CurrentWeatherModel get data;
  @JsonKey(ignore: true)
  _$$CityStateDataCopyWith<_$CityStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CityStateLoadingCopyWith<$Res> {
  factory _$$CityStateLoadingCopyWith(
          _$CityStateLoading value, $Res Function(_$CityStateLoading) then) =
      __$$CityStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CityStateLoadingCopyWithImpl<$Res>
    extends _$CityStateCopyWithImpl<$Res>
    implements _$$CityStateLoadingCopyWith<$Res> {
  __$$CityStateLoadingCopyWithImpl(
      _$CityStateLoading _value, $Res Function(_$CityStateLoading) _then)
      : super(_value, (v) => _then(v as _$CityStateLoading));

  @override
  _$CityStateLoading get _value => super._value as _$CityStateLoading;
}

/// @nodoc

class _$CityStateLoading implements CityStateLoading {
  const _$CityStateLoading();

  @override
  String toString() {
    return 'CityState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CityStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(CurrentWeatherModel data) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(CurrentWeatherModel data)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(CurrentWeatherModel data)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
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
    TResult Function(CityStateData value) $default, {
    required TResult Function(CityStateLoading value) loading,
    required TResult Function(CityStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(CityStateData value)? $default, {
    TResult Function(CityStateLoading value)? loading,
    TResult Function(CityStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CityStateData value)? $default, {
    TResult Function(CityStateLoading value)? loading,
    TResult Function(CityStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CityStateLoading implements CityState {
  const factory CityStateLoading() = _$CityStateLoading;
}

/// @nodoc
abstract class _$$CityStateErrorCopyWith<$Res> {
  factory _$$CityStateErrorCopyWith(
          _$CityStateError value, $Res Function(_$CityStateError) then) =
      __$$CityStateErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class __$$CityStateErrorCopyWithImpl<$Res> extends _$CityStateCopyWithImpl<$Res>
    implements _$$CityStateErrorCopyWith<$Res> {
  __$$CityStateErrorCopyWithImpl(
      _$CityStateError _value, $Res Function(_$CityStateError) _then)
      : super(_value, (v) => _then(v as _$CityStateError));

  @override
  _$CityStateError get _value => super._value as _$CityStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$CityStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$CityStateError implements CityStateError {
  const _$CityStateError(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'CityState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$CityStateErrorCopyWith<_$CityStateError> get copyWith =>
      __$$CityStateErrorCopyWithImpl<_$CityStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(CurrentWeatherModel data) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(CurrentWeatherModel data)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(CurrentWeatherModel data)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
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
    TResult Function(CityStateData value) $default, {
    required TResult Function(CityStateLoading value) loading,
    required TResult Function(CityStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(CityStateData value)? $default, {
    TResult Function(CityStateLoading value)? loading,
    TResult Function(CityStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CityStateData value)? $default, {
    TResult Function(CityStateLoading value)? loading,
    TResult Function(CityStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CityStateError implements CityState {
  const factory CityStateError(final dynamic error) = _$CityStateError;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$CityStateErrorCopyWith<_$CityStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
