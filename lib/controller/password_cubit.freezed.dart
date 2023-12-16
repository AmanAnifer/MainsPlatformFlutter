// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PasswordState _$PasswordStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initial':
      return PasswordInitial.fromJson(json);
    case 'incomplete':
      return PasswordIncomplete.fromJson(json);
    case 'complete':
      return PasswordComplete.fromJson(json);
    case 'error':
      return PasswordError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PasswordState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PasswordState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String passwordHint, bool isWrong) incomplete,
    required TResult Function() complete,
    required TResult Function(String error, String stacktrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String passwordHint, bool isWrong)? incomplete,
    TResult? Function()? complete,
    TResult? Function(String error, String stacktrace)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String passwordHint, bool isWrong)? incomplete,
    TResult Function()? complete,
    TResult Function(String error, String stacktrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordInitial value) initial,
    required TResult Function(PasswordIncomplete value) incomplete,
    required TResult Function(PasswordComplete value) complete,
    required TResult Function(PasswordError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PasswordInitial value)? initial,
    TResult? Function(PasswordIncomplete value)? incomplete,
    TResult? Function(PasswordComplete value)? complete,
    TResult? Function(PasswordError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordInitial value)? initial,
    TResult Function(PasswordIncomplete value)? incomplete,
    TResult Function(PasswordComplete value)? complete,
    TResult Function(PasswordError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordStateCopyWith<$Res> {
  factory $PasswordStateCopyWith(
          PasswordState value, $Res Function(PasswordState) then) =
      _$PasswordStateCopyWithImpl<$Res, PasswordState>;
}

/// @nodoc
class _$PasswordStateCopyWithImpl<$Res, $Val extends PasswordState>
    implements $PasswordStateCopyWith<$Res> {
  _$PasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PasswordInitialImplCopyWith<$Res> {
  factory _$$PasswordInitialImplCopyWith(_$PasswordInitialImpl value,
          $Res Function(_$PasswordInitialImpl) then) =
      __$$PasswordInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasswordInitialImplCopyWithImpl<$Res>
    extends _$PasswordStateCopyWithImpl<$Res, _$PasswordInitialImpl>
    implements _$$PasswordInitialImplCopyWith<$Res> {
  __$$PasswordInitialImplCopyWithImpl(
      _$PasswordInitialImpl _value, $Res Function(_$PasswordInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$PasswordInitialImpl implements PasswordInitial {
  const _$PasswordInitialImpl({final String? $type})
      : $type = $type ?? 'initial';

  factory _$PasswordInitialImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordInitialImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PasswordState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PasswordInitialImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String passwordHint, bool isWrong) incomplete,
    required TResult Function() complete,
    required TResult Function(String error, String stacktrace) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String passwordHint, bool isWrong)? incomplete,
    TResult? Function()? complete,
    TResult? Function(String error, String stacktrace)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String passwordHint, bool isWrong)? incomplete,
    TResult Function()? complete,
    TResult Function(String error, String stacktrace)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordInitial value) initial,
    required TResult Function(PasswordIncomplete value) incomplete,
    required TResult Function(PasswordComplete value) complete,
    required TResult Function(PasswordError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PasswordInitial value)? initial,
    TResult? Function(PasswordIncomplete value)? incomplete,
    TResult? Function(PasswordComplete value)? complete,
    TResult? Function(PasswordError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordInitial value)? initial,
    TResult Function(PasswordIncomplete value)? incomplete,
    TResult Function(PasswordComplete value)? complete,
    TResult Function(PasswordError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordInitialImplToJson(
      this,
    );
  }
}

abstract class PasswordInitial implements PasswordState {
  const factory PasswordInitial() = _$PasswordInitialImpl;

  factory PasswordInitial.fromJson(Map<String, dynamic> json) =
      _$PasswordInitialImpl.fromJson;
}

/// @nodoc
abstract class _$$PasswordIncompleteImplCopyWith<$Res> {
  factory _$$PasswordIncompleteImplCopyWith(_$PasswordIncompleteImpl value,
          $Res Function(_$PasswordIncompleteImpl) then) =
      __$$PasswordIncompleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String passwordHint, bool isWrong});
}

/// @nodoc
class __$$PasswordIncompleteImplCopyWithImpl<$Res>
    extends _$PasswordStateCopyWithImpl<$Res, _$PasswordIncompleteImpl>
    implements _$$PasswordIncompleteImplCopyWith<$Res> {
  __$$PasswordIncompleteImplCopyWithImpl(_$PasswordIncompleteImpl _value,
      $Res Function(_$PasswordIncompleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordHint = null,
    Object? isWrong = null,
  }) {
    return _then(_$PasswordIncompleteImpl(
      passwordHint: null == passwordHint
          ? _value.passwordHint
          : passwordHint // ignore: cast_nullable_to_non_nullable
              as String,
      isWrong: null == isWrong
          ? _value.isWrong
          : isWrong // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PasswordIncompleteImpl implements PasswordIncomplete {
  const _$PasswordIncompleteImpl(
      {required this.passwordHint, this.isWrong = false, final String? $type})
      : $type = $type ?? 'incomplete';

  factory _$PasswordIncompleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordIncompleteImplFromJson(json);

  @override
  final String passwordHint;
  @override
  @JsonKey()
  final bool isWrong;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PasswordState.incomplete(passwordHint: $passwordHint, isWrong: $isWrong)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordIncompleteImpl &&
            (identical(other.passwordHint, passwordHint) ||
                other.passwordHint == passwordHint) &&
            (identical(other.isWrong, isWrong) || other.isWrong == isWrong));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, passwordHint, isWrong);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordIncompleteImplCopyWith<_$PasswordIncompleteImpl> get copyWith =>
      __$$PasswordIncompleteImplCopyWithImpl<_$PasswordIncompleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String passwordHint, bool isWrong) incomplete,
    required TResult Function() complete,
    required TResult Function(String error, String stacktrace) error,
  }) {
    return incomplete(passwordHint, isWrong);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String passwordHint, bool isWrong)? incomplete,
    TResult? Function()? complete,
    TResult? Function(String error, String stacktrace)? error,
  }) {
    return incomplete?.call(passwordHint, isWrong);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String passwordHint, bool isWrong)? incomplete,
    TResult Function()? complete,
    TResult Function(String error, String stacktrace)? error,
    required TResult orElse(),
  }) {
    if (incomplete != null) {
      return incomplete(passwordHint, isWrong);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordInitial value) initial,
    required TResult Function(PasswordIncomplete value) incomplete,
    required TResult Function(PasswordComplete value) complete,
    required TResult Function(PasswordError value) error,
  }) {
    return incomplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PasswordInitial value)? initial,
    TResult? Function(PasswordIncomplete value)? incomplete,
    TResult? Function(PasswordComplete value)? complete,
    TResult? Function(PasswordError value)? error,
  }) {
    return incomplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordInitial value)? initial,
    TResult Function(PasswordIncomplete value)? incomplete,
    TResult Function(PasswordComplete value)? complete,
    TResult Function(PasswordError value)? error,
    required TResult orElse(),
  }) {
    if (incomplete != null) {
      return incomplete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordIncompleteImplToJson(
      this,
    );
  }
}

abstract class PasswordIncomplete implements PasswordState {
  const factory PasswordIncomplete(
      {required final String passwordHint,
      final bool isWrong}) = _$PasswordIncompleteImpl;

  factory PasswordIncomplete.fromJson(Map<String, dynamic> json) =
      _$PasswordIncompleteImpl.fromJson;

  String get passwordHint;
  bool get isWrong;
  @JsonKey(ignore: true)
  _$$PasswordIncompleteImplCopyWith<_$PasswordIncompleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordCompleteImplCopyWith<$Res> {
  factory _$$PasswordCompleteImplCopyWith(_$PasswordCompleteImpl value,
          $Res Function(_$PasswordCompleteImpl) then) =
      __$$PasswordCompleteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasswordCompleteImplCopyWithImpl<$Res>
    extends _$PasswordStateCopyWithImpl<$Res, _$PasswordCompleteImpl>
    implements _$$PasswordCompleteImplCopyWith<$Res> {
  __$$PasswordCompleteImplCopyWithImpl(_$PasswordCompleteImpl _value,
      $Res Function(_$PasswordCompleteImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$PasswordCompleteImpl implements PasswordComplete {
  const _$PasswordCompleteImpl({final String? $type})
      : $type = $type ?? 'complete';

  factory _$PasswordCompleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordCompleteImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PasswordState.complete()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PasswordCompleteImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String passwordHint, bool isWrong) incomplete,
    required TResult Function() complete,
    required TResult Function(String error, String stacktrace) error,
  }) {
    return complete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String passwordHint, bool isWrong)? incomplete,
    TResult? Function()? complete,
    TResult? Function(String error, String stacktrace)? error,
  }) {
    return complete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String passwordHint, bool isWrong)? incomplete,
    TResult Function()? complete,
    TResult Function(String error, String stacktrace)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordInitial value) initial,
    required TResult Function(PasswordIncomplete value) incomplete,
    required TResult Function(PasswordComplete value) complete,
    required TResult Function(PasswordError value) error,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PasswordInitial value)? initial,
    TResult? Function(PasswordIncomplete value)? incomplete,
    TResult? Function(PasswordComplete value)? complete,
    TResult? Function(PasswordError value)? error,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordInitial value)? initial,
    TResult Function(PasswordIncomplete value)? incomplete,
    TResult Function(PasswordComplete value)? complete,
    TResult Function(PasswordError value)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordCompleteImplToJson(
      this,
    );
  }
}

abstract class PasswordComplete implements PasswordState {
  const factory PasswordComplete() = _$PasswordCompleteImpl;

  factory PasswordComplete.fromJson(Map<String, dynamic> json) =
      _$PasswordCompleteImpl.fromJson;
}

/// @nodoc
abstract class _$$PasswordErrorImplCopyWith<$Res> {
  factory _$$PasswordErrorImplCopyWith(
          _$PasswordErrorImpl value, $Res Function(_$PasswordErrorImpl) then) =
      __$$PasswordErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error, String stacktrace});
}

/// @nodoc
class __$$PasswordErrorImplCopyWithImpl<$Res>
    extends _$PasswordStateCopyWithImpl<$Res, _$PasswordErrorImpl>
    implements _$$PasswordErrorImplCopyWith<$Res> {
  __$$PasswordErrorImplCopyWithImpl(
      _$PasswordErrorImpl _value, $Res Function(_$PasswordErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stacktrace = null,
  }) {
    return _then(_$PasswordErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      stacktrace: null == stacktrace
          ? _value.stacktrace
          : stacktrace // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PasswordErrorImpl implements PasswordError {
  const _$PasswordErrorImpl(
      {required this.error, required this.stacktrace, final String? $type})
      : $type = $type ?? 'error';

  factory _$PasswordErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordErrorImplFromJson(json);

  @override
  final String error;
  @override
  final String stacktrace;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PasswordState.error(error: $error, stacktrace: $stacktrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.stacktrace, stacktrace) ||
                other.stacktrace == stacktrace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, stacktrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordErrorImplCopyWith<_$PasswordErrorImpl> get copyWith =>
      __$$PasswordErrorImplCopyWithImpl<_$PasswordErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String passwordHint, bool isWrong) incomplete,
    required TResult Function() complete,
    required TResult Function(String error, String stacktrace) error,
  }) {
    return error(this.error, stacktrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String passwordHint, bool isWrong)? incomplete,
    TResult? Function()? complete,
    TResult? Function(String error, String stacktrace)? error,
  }) {
    return error?.call(this.error, stacktrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String passwordHint, bool isWrong)? incomplete,
    TResult Function()? complete,
    TResult Function(String error, String stacktrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stacktrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordInitial value) initial,
    required TResult Function(PasswordIncomplete value) incomplete,
    required TResult Function(PasswordComplete value) complete,
    required TResult Function(PasswordError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PasswordInitial value)? initial,
    TResult? Function(PasswordIncomplete value)? incomplete,
    TResult? Function(PasswordComplete value)? complete,
    TResult? Function(PasswordError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordInitial value)? initial,
    TResult Function(PasswordIncomplete value)? incomplete,
    TResult Function(PasswordComplete value)? complete,
    TResult Function(PasswordError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordErrorImplToJson(
      this,
    );
  }
}

abstract class PasswordError implements PasswordState {
  const factory PasswordError(
      {required final String error,
      required final String stacktrace}) = _$PasswordErrorImpl;

  factory PasswordError.fromJson(Map<String, dynamic> json) =
      _$PasswordErrorImpl.fromJson;

  String get error;
  String get stacktrace;
  @JsonKey(ignore: true)
  _$$PasswordErrorImplCopyWith<_$PasswordErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
