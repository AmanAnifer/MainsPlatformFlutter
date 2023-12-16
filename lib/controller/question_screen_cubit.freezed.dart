// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionScreenState _$QuestionScreenStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initial':
      return QuestionScreenInitial.fromJson(json);
    case 'loading':
      return QuestionScreenLoading.fromJson(json);
    case 'error':
      return QuestionScreenError.fromJson(json);
    case 'timeFinished':
      return QuestionScreenTimeFinished.fromJson(json);
    case 'loaded':
      return QuestionScreenLoaded.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'QuestionScreenState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$QuestionScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error, String stackTraceString) error,
    required TResult Function() timeFinished,
    required TResult Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error, String stackTraceString)? error,
    TResult? Function()? timeFinished,
    TResult? Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error, String stackTraceString)? error,
    TResult Function()? timeFinished,
    TResult Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionScreenInitial value) initial,
    required TResult Function(QuestionScreenLoading value) loading,
    required TResult Function(QuestionScreenError value) error,
    required TResult Function(QuestionScreenTimeFinished value) timeFinished,
    required TResult Function(QuestionScreenLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionScreenInitial value)? initial,
    TResult? Function(QuestionScreenLoading value)? loading,
    TResult? Function(QuestionScreenError value)? error,
    TResult? Function(QuestionScreenTimeFinished value)? timeFinished,
    TResult? Function(QuestionScreenLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionScreenInitial value)? initial,
    TResult Function(QuestionScreenLoading value)? loading,
    TResult Function(QuestionScreenError value)? error,
    TResult Function(QuestionScreenTimeFinished value)? timeFinished,
    TResult Function(QuestionScreenLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionScreenStateCopyWith<$Res> {
  factory $QuestionScreenStateCopyWith(
          QuestionScreenState value, $Res Function(QuestionScreenState) then) =
      _$QuestionScreenStateCopyWithImpl<$Res, QuestionScreenState>;
}

/// @nodoc
class _$QuestionScreenStateCopyWithImpl<$Res, $Val extends QuestionScreenState>
    implements $QuestionScreenStateCopyWith<$Res> {
  _$QuestionScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$QuestionScreenInitialImplCopyWith<$Res> {
  factory _$$QuestionScreenInitialImplCopyWith(
          _$QuestionScreenInitialImpl value,
          $Res Function(_$QuestionScreenInitialImpl) then) =
      __$$QuestionScreenInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuestionScreenInitialImplCopyWithImpl<$Res>
    extends _$QuestionScreenStateCopyWithImpl<$Res, _$QuestionScreenInitialImpl>
    implements _$$QuestionScreenInitialImplCopyWith<$Res> {
  __$$QuestionScreenInitialImplCopyWithImpl(_$QuestionScreenInitialImpl _value,
      $Res Function(_$QuestionScreenInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$QuestionScreenInitialImpl implements QuestionScreenInitial {
  _$QuestionScreenInitialImpl({final String? $type})
      : $type = $type ?? 'initial';

  factory _$QuestionScreenInitialImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionScreenInitialImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuestionScreenState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionScreenInitialImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error, String stackTraceString) error,
    required TResult Function() timeFinished,
    required TResult Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error, String stackTraceString)? error,
    TResult? Function()? timeFinished,
    TResult? Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)?
        loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error, String stackTraceString)? error,
    TResult Function()? timeFinished,
    TResult Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)?
        loaded,
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
    required TResult Function(QuestionScreenInitial value) initial,
    required TResult Function(QuestionScreenLoading value) loading,
    required TResult Function(QuestionScreenError value) error,
    required TResult Function(QuestionScreenTimeFinished value) timeFinished,
    required TResult Function(QuestionScreenLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionScreenInitial value)? initial,
    TResult? Function(QuestionScreenLoading value)? loading,
    TResult? Function(QuestionScreenError value)? error,
    TResult? Function(QuestionScreenTimeFinished value)? timeFinished,
    TResult? Function(QuestionScreenLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionScreenInitial value)? initial,
    TResult Function(QuestionScreenLoading value)? loading,
    TResult Function(QuestionScreenError value)? error,
    TResult Function(QuestionScreenTimeFinished value)? timeFinished,
    TResult Function(QuestionScreenLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionScreenInitialImplToJson(
      this,
    );
  }
}

abstract class QuestionScreenInitial implements QuestionScreenState {
  factory QuestionScreenInitial() = _$QuestionScreenInitialImpl;

  factory QuestionScreenInitial.fromJson(Map<String, dynamic> json) =
      _$QuestionScreenInitialImpl.fromJson;
}

/// @nodoc
abstract class _$$QuestionScreenLoadingImplCopyWith<$Res> {
  factory _$$QuestionScreenLoadingImplCopyWith(
          _$QuestionScreenLoadingImpl value,
          $Res Function(_$QuestionScreenLoadingImpl) then) =
      __$$QuestionScreenLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuestionScreenLoadingImplCopyWithImpl<$Res>
    extends _$QuestionScreenStateCopyWithImpl<$Res, _$QuestionScreenLoadingImpl>
    implements _$$QuestionScreenLoadingImplCopyWith<$Res> {
  __$$QuestionScreenLoadingImplCopyWithImpl(_$QuestionScreenLoadingImpl _value,
      $Res Function(_$QuestionScreenLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$QuestionScreenLoadingImpl implements QuestionScreenLoading {
  _$QuestionScreenLoadingImpl({final String? $type})
      : $type = $type ?? 'loading';

  factory _$QuestionScreenLoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionScreenLoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuestionScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionScreenLoadingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error, String stackTraceString) error,
    required TResult Function() timeFinished,
    required TResult Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error, String stackTraceString)? error,
    TResult? Function()? timeFinished,
    TResult? Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)?
        loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error, String stackTraceString)? error,
    TResult Function()? timeFinished,
    TResult Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)?
        loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionScreenInitial value) initial,
    required TResult Function(QuestionScreenLoading value) loading,
    required TResult Function(QuestionScreenError value) error,
    required TResult Function(QuestionScreenTimeFinished value) timeFinished,
    required TResult Function(QuestionScreenLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionScreenInitial value)? initial,
    TResult? Function(QuestionScreenLoading value)? loading,
    TResult? Function(QuestionScreenError value)? error,
    TResult? Function(QuestionScreenTimeFinished value)? timeFinished,
    TResult? Function(QuestionScreenLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionScreenInitial value)? initial,
    TResult Function(QuestionScreenLoading value)? loading,
    TResult Function(QuestionScreenError value)? error,
    TResult Function(QuestionScreenTimeFinished value)? timeFinished,
    TResult Function(QuestionScreenLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionScreenLoadingImplToJson(
      this,
    );
  }
}

abstract class QuestionScreenLoading implements QuestionScreenState {
  factory QuestionScreenLoading() = _$QuestionScreenLoadingImpl;

  factory QuestionScreenLoading.fromJson(Map<String, dynamic> json) =
      _$QuestionScreenLoadingImpl.fromJson;
}

/// @nodoc
abstract class _$$QuestionScreenErrorImplCopyWith<$Res> {
  factory _$$QuestionScreenErrorImplCopyWith(_$QuestionScreenErrorImpl value,
          $Res Function(_$QuestionScreenErrorImpl) then) =
      __$$QuestionScreenErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error, String stackTraceString});
}

/// @nodoc
class __$$QuestionScreenErrorImplCopyWithImpl<$Res>
    extends _$QuestionScreenStateCopyWithImpl<$Res, _$QuestionScreenErrorImpl>
    implements _$$QuestionScreenErrorImplCopyWith<$Res> {
  __$$QuestionScreenErrorImplCopyWithImpl(_$QuestionScreenErrorImpl _value,
      $Res Function(_$QuestionScreenErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTraceString = null,
  }) {
    return _then(_$QuestionScreenErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      stackTraceString: null == stackTraceString
          ? _value.stackTraceString
          : stackTraceString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionScreenErrorImpl implements QuestionScreenError {
  _$QuestionScreenErrorImpl(
      {required this.error,
      required this.stackTraceString,
      final String? $type})
      : $type = $type ?? 'error';

  factory _$QuestionScreenErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionScreenErrorImplFromJson(json);

  @override
  final String error;
  @override
  final String stackTraceString;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuestionScreenState.error(error: $error, stackTraceString: $stackTraceString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionScreenErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.stackTraceString, stackTraceString) ||
                other.stackTraceString == stackTraceString));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, stackTraceString);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionScreenErrorImplCopyWith<_$QuestionScreenErrorImpl> get copyWith =>
      __$$QuestionScreenErrorImplCopyWithImpl<_$QuestionScreenErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error, String stackTraceString) error,
    required TResult Function() timeFinished,
    required TResult Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)
        loaded,
  }) {
    return error(this.error, stackTraceString);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error, String stackTraceString)? error,
    TResult? Function()? timeFinished,
    TResult? Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)?
        loaded,
  }) {
    return error?.call(this.error, stackTraceString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error, String stackTraceString)? error,
    TResult Function()? timeFinished,
    TResult Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)?
        loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stackTraceString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionScreenInitial value) initial,
    required TResult Function(QuestionScreenLoading value) loading,
    required TResult Function(QuestionScreenError value) error,
    required TResult Function(QuestionScreenTimeFinished value) timeFinished,
    required TResult Function(QuestionScreenLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionScreenInitial value)? initial,
    TResult? Function(QuestionScreenLoading value)? loading,
    TResult? Function(QuestionScreenError value)? error,
    TResult? Function(QuestionScreenTimeFinished value)? timeFinished,
    TResult? Function(QuestionScreenLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionScreenInitial value)? initial,
    TResult Function(QuestionScreenLoading value)? loading,
    TResult Function(QuestionScreenError value)? error,
    TResult Function(QuestionScreenTimeFinished value)? timeFinished,
    TResult Function(QuestionScreenLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionScreenErrorImplToJson(
      this,
    );
  }
}

abstract class QuestionScreenError implements QuestionScreenState {
  factory QuestionScreenError(
      {required final String error,
      required final String stackTraceString}) = _$QuestionScreenErrorImpl;

  factory QuestionScreenError.fromJson(Map<String, dynamic> json) =
      _$QuestionScreenErrorImpl.fromJson;

  String get error;
  String get stackTraceString;
  @JsonKey(ignore: true)
  _$$QuestionScreenErrorImplCopyWith<_$QuestionScreenErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuestionScreenTimeFinishedImplCopyWith<$Res> {
  factory _$$QuestionScreenTimeFinishedImplCopyWith(
          _$QuestionScreenTimeFinishedImpl value,
          $Res Function(_$QuestionScreenTimeFinishedImpl) then) =
      __$$QuestionScreenTimeFinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuestionScreenTimeFinishedImplCopyWithImpl<$Res>
    extends _$QuestionScreenStateCopyWithImpl<$Res,
        _$QuestionScreenTimeFinishedImpl>
    implements _$$QuestionScreenTimeFinishedImplCopyWith<$Res> {
  __$$QuestionScreenTimeFinishedImplCopyWithImpl(
      _$QuestionScreenTimeFinishedImpl _value,
      $Res Function(_$QuestionScreenTimeFinishedImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$QuestionScreenTimeFinishedImpl implements QuestionScreenTimeFinished {
  _$QuestionScreenTimeFinishedImpl({final String? $type})
      : $type = $type ?? 'timeFinished';

  factory _$QuestionScreenTimeFinishedImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$QuestionScreenTimeFinishedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuestionScreenState.timeFinished()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionScreenTimeFinishedImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error, String stackTraceString) error,
    required TResult Function() timeFinished,
    required TResult Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)
        loaded,
  }) {
    return timeFinished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error, String stackTraceString)? error,
    TResult? Function()? timeFinished,
    TResult? Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)?
        loaded,
  }) {
    return timeFinished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error, String stackTraceString)? error,
    TResult Function()? timeFinished,
    TResult Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)?
        loaded,
    required TResult orElse(),
  }) {
    if (timeFinished != null) {
      return timeFinished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionScreenInitial value) initial,
    required TResult Function(QuestionScreenLoading value) loading,
    required TResult Function(QuestionScreenError value) error,
    required TResult Function(QuestionScreenTimeFinished value) timeFinished,
    required TResult Function(QuestionScreenLoaded value) loaded,
  }) {
    return timeFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionScreenInitial value)? initial,
    TResult? Function(QuestionScreenLoading value)? loading,
    TResult? Function(QuestionScreenError value)? error,
    TResult? Function(QuestionScreenTimeFinished value)? timeFinished,
    TResult? Function(QuestionScreenLoaded value)? loaded,
  }) {
    return timeFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionScreenInitial value)? initial,
    TResult Function(QuestionScreenLoading value)? loading,
    TResult Function(QuestionScreenError value)? error,
    TResult Function(QuestionScreenTimeFinished value)? timeFinished,
    TResult Function(QuestionScreenLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (timeFinished != null) {
      return timeFinished(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionScreenTimeFinishedImplToJson(
      this,
    );
  }
}

abstract class QuestionScreenTimeFinished implements QuestionScreenState {
  factory QuestionScreenTimeFinished() = _$QuestionScreenTimeFinishedImpl;

  factory QuestionScreenTimeFinished.fromJson(Map<String, dynamic> json) =
      _$QuestionScreenTimeFinishedImpl.fromJson;
}

/// @nodoc
abstract class _$$QuestionScreenLoadedImplCopyWith<$Res> {
  factory _$$QuestionScreenLoadedImplCopyWith(_$QuestionScreenLoadedImpl value,
          $Res Function(_$QuestionScreenLoadedImpl) then) =
      __$$QuestionScreenLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int currentQuestionIndex,
      List<Question> questions,
      Map<int, Answer> answers,
      bool showPageButtons,
      bool showNextButton});
}

/// @nodoc
class __$$QuestionScreenLoadedImplCopyWithImpl<$Res>
    extends _$QuestionScreenStateCopyWithImpl<$Res, _$QuestionScreenLoadedImpl>
    implements _$$QuestionScreenLoadedImplCopyWith<$Res> {
  __$$QuestionScreenLoadedImplCopyWithImpl(_$QuestionScreenLoadedImpl _value,
      $Res Function(_$QuestionScreenLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentQuestionIndex = null,
    Object? questions = null,
    Object? answers = null,
    Object? showPageButtons = null,
    Object? showNextButton = null,
  }) {
    return _then(_$QuestionScreenLoadedImpl(
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<int, Answer>,
      showPageButtons: null == showPageButtons
          ? _value.showPageButtons
          : showPageButtons // ignore: cast_nullable_to_non_nullable
              as bool,
      showNextButton: null == showNextButton
          ? _value.showNextButton
          : showNextButton // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionScreenLoadedImpl implements QuestionScreenLoaded {
  _$QuestionScreenLoadedImpl(
      {required this.currentQuestionIndex,
      required final List<Question> questions,
      final Map<int, Answer> answers = const {},
      this.showPageButtons = false,
      this.showNextButton = false,
      final String? $type})
      : _questions = questions,
        _answers = answers,
        $type = $type ?? 'loaded';

  factory _$QuestionScreenLoadedImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionScreenLoadedImplFromJson(json);

  @override
  final int currentQuestionIndex;
  final List<Question> _questions;
  @override
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  final Map<int, Answer> _answers;
  @override
  @JsonKey()
  Map<int, Answer> get answers {
    if (_answers is EqualUnmodifiableMapView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

  @override
  @JsonKey()
  final bool showPageButtons;
  @override
  @JsonKey()
  final bool showNextButton;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuestionScreenState.loaded(currentQuestionIndex: $currentQuestionIndex, questions: $questions, answers: $answers, showPageButtons: $showPageButtons, showNextButton: $showNextButton)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionScreenLoadedImpl &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.showPageButtons, showPageButtons) ||
                other.showPageButtons == showPageButtons) &&
            (identical(other.showNextButton, showNextButton) ||
                other.showNextButton == showNextButton));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentQuestionIndex,
      const DeepCollectionEquality().hash(_questions),
      const DeepCollectionEquality().hash(_answers),
      showPageButtons,
      showNextButton);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionScreenLoadedImplCopyWith<_$QuestionScreenLoadedImpl>
      get copyWith =>
          __$$QuestionScreenLoadedImplCopyWithImpl<_$QuestionScreenLoadedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error, String stackTraceString) error,
    required TResult Function() timeFinished,
    required TResult Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)
        loaded,
  }) {
    return loaded(currentQuestionIndex, questions, answers, showPageButtons,
        showNextButton);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error, String stackTraceString)? error,
    TResult? Function()? timeFinished,
    TResult? Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)?
        loaded,
  }) {
    return loaded?.call(currentQuestionIndex, questions, answers,
        showPageButtons, showNextButton);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error, String stackTraceString)? error,
    TResult Function()? timeFinished,
    TResult Function(
            int currentQuestionIndex,
            List<Question> questions,
            Map<int, Answer> answers,
            bool showPageButtons,
            bool showNextButton)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(currentQuestionIndex, questions, answers, showPageButtons,
          showNextButton);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionScreenInitial value) initial,
    required TResult Function(QuestionScreenLoading value) loading,
    required TResult Function(QuestionScreenError value) error,
    required TResult Function(QuestionScreenTimeFinished value) timeFinished,
    required TResult Function(QuestionScreenLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionScreenInitial value)? initial,
    TResult? Function(QuestionScreenLoading value)? loading,
    TResult? Function(QuestionScreenError value)? error,
    TResult? Function(QuestionScreenTimeFinished value)? timeFinished,
    TResult? Function(QuestionScreenLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionScreenInitial value)? initial,
    TResult Function(QuestionScreenLoading value)? loading,
    TResult Function(QuestionScreenError value)? error,
    TResult Function(QuestionScreenTimeFinished value)? timeFinished,
    TResult Function(QuestionScreenLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionScreenLoadedImplToJson(
      this,
    );
  }
}

abstract class QuestionScreenLoaded implements QuestionScreenState {
  factory QuestionScreenLoaded(
      {required final int currentQuestionIndex,
      required final List<Question> questions,
      final Map<int, Answer> answers,
      final bool showPageButtons,
      final bool showNextButton}) = _$QuestionScreenLoadedImpl;

  factory QuestionScreenLoaded.fromJson(Map<String, dynamic> json) =
      _$QuestionScreenLoadedImpl.fromJson;

  int get currentQuestionIndex;
  List<Question> get questions;
  Map<int, Answer> get answers;
  bool get showPageButtons;
  bool get showNextButton;
  @JsonKey(ignore: true)
  _$$QuestionScreenLoadedImplCopyWith<_$QuestionScreenLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
