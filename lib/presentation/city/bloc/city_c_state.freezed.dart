// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'city_c_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CityCState {
  CityCStateStatus get status => throw _privateConstructorUsedError;
  List<Item> get data => throw _privateConstructorUsedError;
  bool get selectedAll => throw _privateConstructorUsedError;
  int get selectedItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CityCStateCopyWith<CityCState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityCStateCopyWith<$Res> {
  factory $CityCStateCopyWith(
          CityCState value, $Res Function(CityCState) then) =
      _$CityCStateCopyWithImpl<$Res>;
  $Res call(
      {CityCStateStatus status,
      List<Item> data,
      bool selectedAll,
      int selectedItem});
}

/// @nodoc
class _$CityCStateCopyWithImpl<$Res> implements $CityCStateCopyWith<$Res> {
  _$CityCStateCopyWithImpl(this._value, this._then);

  final CityCState _value;
  // ignore: unused_field
  final $Res Function(CityCState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? selectedAll = freezed,
    Object? selectedItem = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CityCStateStatus,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      selectedAll: selectedAll == freezed
          ? _value.selectedAll
          : selectedAll // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedItem: selectedItem == freezed
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_CityCStateCopyWith<$Res>
    implements $CityCStateCopyWith<$Res> {
  factory _$$_CityCStateCopyWith(
          _$_CityCState value, $Res Function(_$_CityCState) then) =
      __$$_CityCStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {CityCStateStatus status,
      List<Item> data,
      bool selectedAll,
      int selectedItem});
}

/// @nodoc
class __$$_CityCStateCopyWithImpl<$Res> extends _$CityCStateCopyWithImpl<$Res>
    implements _$$_CityCStateCopyWith<$Res> {
  __$$_CityCStateCopyWithImpl(
      _$_CityCState _value, $Res Function(_$_CityCState) _then)
      : super(_value, (v) => _then(v as _$_CityCState));

  @override
  _$_CityCState get _value => super._value as _$_CityCState;

  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? selectedAll = freezed,
    Object? selectedItem = freezed,
  }) {
    return _then(_$_CityCState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CityCStateStatus,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      selectedAll: selectedAll == freezed
          ? _value.selectedAll
          : selectedAll // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedItem: selectedItem == freezed
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CityCState implements _CityCState {
  _$_CityCState(
      {this.status = CityCStateStatus.none,
      final List<Item> data = const [],
      this.selectedAll = false,
      this.selectedItem = 0})
      : _data = data;

  @override
  @JsonKey()
  final CityCStateStatus status;
  final List<Item> _data;
  @override
  @JsonKey()
  List<Item> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final bool selectedAll;
  @override
  @JsonKey()
  final int selectedItem;

  @override
  String toString() {
    return 'CityCState(status: $status, data: $data, selectedAll: $selectedAll, selectedItem: $selectedItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CityCState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other.selectedAll, selectedAll) &&
            const DeepCollectionEquality()
                .equals(other.selectedItem, selectedItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(selectedAll),
      const DeepCollectionEquality().hash(selectedItem));

  @JsonKey(ignore: true)
  @override
  _$$_CityCStateCopyWith<_$_CityCState> get copyWith =>
      __$$_CityCStateCopyWithImpl<_$_CityCState>(this, _$identity);
}

abstract class _CityCState implements CityCState {
  factory _CityCState(
      {final CityCStateStatus status,
      final List<Item> data,
      final bool selectedAll,
      final int selectedItem}) = _$_CityCState;

  @override
  CityCStateStatus get status;
  @override
  List<Item> get data;
  @override
  bool get selectedAll;
  @override
  int get selectedItem;
  @override
  @JsonKey(ignore: true)
  _$$_CityCStateCopyWith<_$_CityCState> get copyWith =>
      throw _privateConstructorUsedError;
}
