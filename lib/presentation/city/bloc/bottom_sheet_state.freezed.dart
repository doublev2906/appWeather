// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bottom_sheet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BottomSheetState {
  BottomSheetStatus get status => throw _privateConstructorUsedError;
  List<CityModel> get result => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomSheetStateCopyWith<BottomSheetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomSheetStateCopyWith<$Res> {
  factory $BottomSheetStateCopyWith(
          BottomSheetState value, $Res Function(BottomSheetState) then) =
      _$BottomSheetStateCopyWithImpl<$Res>;
  $Res call({BottomSheetStatus status, List<CityModel> result});
}

/// @nodoc
class _$BottomSheetStateCopyWithImpl<$Res>
    implements $BottomSheetStateCopyWith<$Res> {
  _$BottomSheetStateCopyWithImpl(this._value, this._then);

  final BottomSheetState _value;
  // ignore: unused_field
  final $Res Function(BottomSheetState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BottomSheetStatus,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_BottomSheetStateCopyWith<$Res>
    implements $BottomSheetStateCopyWith<$Res> {
  factory _$$_BottomSheetStateCopyWith(
          _$_BottomSheetState value, $Res Function(_$_BottomSheetState) then) =
      __$$_BottomSheetStateCopyWithImpl<$Res>;
  @override
  $Res call({BottomSheetStatus status, List<CityModel> result});
}

/// @nodoc
class __$$_BottomSheetStateCopyWithImpl<$Res>
    extends _$BottomSheetStateCopyWithImpl<$Res>
    implements _$$_BottomSheetStateCopyWith<$Res> {
  __$$_BottomSheetStateCopyWithImpl(
      _$_BottomSheetState _value, $Res Function(_$_BottomSheetState) _then)
      : super(_value, (v) => _then(v as _$_BottomSheetState));

  @override
  _$_BottomSheetState get _value => super._value as _$_BottomSheetState;

  @override
  $Res call({
    Object? status = freezed,
    Object? result = freezed,
  }) {
    return _then(_$_BottomSheetState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BottomSheetStatus,
      result: result == freezed
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
    ));
  }
}

/// @nodoc

class _$_BottomSheetState implements _BottomSheetState {
  _$_BottomSheetState(
      {this.status = BottomSheetStatus.none,
      final List<CityModel> result = const []})
      : _result = result;

  @override
  @JsonKey()
  final BottomSheetStatus status;
  final List<CityModel> _result;
  @override
  @JsonKey()
  List<CityModel> get result {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'BottomSheetState(status: $status, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BottomSheetState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  _$$_BottomSheetStateCopyWith<_$_BottomSheetState> get copyWith =>
      __$$_BottomSheetStateCopyWithImpl<_$_BottomSheetState>(this, _$identity);
}

abstract class _BottomSheetState implements BottomSheetState {
  factory _BottomSheetState(
      {final BottomSheetStatus status,
      final List<CityModel> result}) = _$_BottomSheetState;

  @override
  BottomSheetStatus get status;
  @override
  List<CityModel> get result;
  @override
  @JsonKey(ignore: true)
  _$$_BottomSheetStateCopyWith<_$_BottomSheetState> get copyWith =>
      throw _privateConstructorUsedError;
}
