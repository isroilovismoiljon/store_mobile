// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPasswordState {

 Status get statusForgotPassword; String? get errorMessageForgotPassword; Status get statusResetPassword; String? get errorMessageReset; Status get statusSendEmail; String? get errorMessageSendEmail;
/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordStateCopyWith<ForgotPasswordState> get copyWith => _$ForgotPasswordStateCopyWithImpl<ForgotPasswordState>(this as ForgotPasswordState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordState&&(identical(other.statusForgotPassword, statusForgotPassword) || other.statusForgotPassword == statusForgotPassword)&&(identical(other.errorMessageForgotPassword, errorMessageForgotPassword) || other.errorMessageForgotPassword == errorMessageForgotPassword)&&(identical(other.statusResetPassword, statusResetPassword) || other.statusResetPassword == statusResetPassword)&&(identical(other.errorMessageReset, errorMessageReset) || other.errorMessageReset == errorMessageReset)&&(identical(other.statusSendEmail, statusSendEmail) || other.statusSendEmail == statusSendEmail)&&(identical(other.errorMessageSendEmail, errorMessageSendEmail) || other.errorMessageSendEmail == errorMessageSendEmail));
}


@override
int get hashCode => Object.hash(runtimeType,statusForgotPassword,errorMessageForgotPassword,statusResetPassword,errorMessageReset,statusSendEmail,errorMessageSendEmail);

@override
String toString() {
  return 'ForgotPasswordState(statusForgotPassword: $statusForgotPassword, errorMessageForgotPassword: $errorMessageForgotPassword, statusResetPassword: $statusResetPassword, errorMessageReset: $errorMessageReset, statusSendEmail: $statusSendEmail, errorMessageSendEmail: $errorMessageSendEmail)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordStateCopyWith<$Res>  {
  factory $ForgotPasswordStateCopyWith(ForgotPasswordState value, $Res Function(ForgotPasswordState) _then) = _$ForgotPasswordStateCopyWithImpl;
@useResult
$Res call({
 Status statusForgotPassword, String? errorMessageForgotPassword, Status statusResetPassword, String? errorMessageReset, Status statusSendEmail, String? errorMessageSendEmail
});




}
/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._self, this._then);

  final ForgotPasswordState _self;
  final $Res Function(ForgotPasswordState) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusForgotPassword = null,Object? errorMessageForgotPassword = freezed,Object? statusResetPassword = null,Object? errorMessageReset = freezed,Object? statusSendEmail = null,Object? errorMessageSendEmail = freezed,}) {
  return _then(_self.copyWith(
statusForgotPassword: null == statusForgotPassword ? _self.statusForgotPassword : statusForgotPassword // ignore: cast_nullable_to_non_nullable
as Status,errorMessageForgotPassword: freezed == errorMessageForgotPassword ? _self.errorMessageForgotPassword : errorMessageForgotPassword // ignore: cast_nullable_to_non_nullable
as String?,statusResetPassword: null == statusResetPassword ? _self.statusResetPassword : statusResetPassword // ignore: cast_nullable_to_non_nullable
as Status,errorMessageReset: freezed == errorMessageReset ? _self.errorMessageReset : errorMessageReset // ignore: cast_nullable_to_non_nullable
as String?,statusSendEmail: null == statusSendEmail ? _self.statusSendEmail : statusSendEmail // ignore: cast_nullable_to_non_nullable
as Status,errorMessageSendEmail: freezed == errorMessageSendEmail ? _self.errorMessageSendEmail : errorMessageSendEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPasswordState].
extension ForgotPasswordStatePatterns on ForgotPasswordState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotPasswordState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPasswordState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotPasswordState value)  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotPasswordState value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status statusForgotPassword,  String? errorMessageForgotPassword,  Status statusResetPassword,  String? errorMessageReset,  Status statusSendEmail,  String? errorMessageSendEmail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotPasswordState() when $default != null:
return $default(_that.statusForgotPassword,_that.errorMessageForgotPassword,_that.statusResetPassword,_that.errorMessageReset,_that.statusSendEmail,_that.errorMessageSendEmail);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status statusForgotPassword,  String? errorMessageForgotPassword,  Status statusResetPassword,  String? errorMessageReset,  Status statusSendEmail,  String? errorMessageSendEmail)  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordState():
return $default(_that.statusForgotPassword,_that.errorMessageForgotPassword,_that.statusResetPassword,_that.errorMessageReset,_that.statusSendEmail,_that.errorMessageSendEmail);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status statusForgotPassword,  String? errorMessageForgotPassword,  Status statusResetPassword,  String? errorMessageReset,  Status statusSendEmail,  String? errorMessageSendEmail)?  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordState() when $default != null:
return $default(_that.statusForgotPassword,_that.errorMessageForgotPassword,_that.statusResetPassword,_that.errorMessageReset,_that.statusSendEmail,_that.errorMessageSendEmail);case _:
  return null;

}
}

}

/// @nodoc


class _ForgotPasswordState implements ForgotPasswordState {
  const _ForgotPasswordState({required this.statusForgotPassword, required this.errorMessageForgotPassword, required this.statusResetPassword, required this.errorMessageReset, required this.statusSendEmail, required this.errorMessageSendEmail});
  

@override final  Status statusForgotPassword;
@override final  String? errorMessageForgotPassword;
@override final  Status statusResetPassword;
@override final  String? errorMessageReset;
@override final  Status statusSendEmail;
@override final  String? errorMessageSendEmail;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPasswordStateCopyWith<_ForgotPasswordState> get copyWith => __$ForgotPasswordStateCopyWithImpl<_ForgotPasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordState&&(identical(other.statusForgotPassword, statusForgotPassword) || other.statusForgotPassword == statusForgotPassword)&&(identical(other.errorMessageForgotPassword, errorMessageForgotPassword) || other.errorMessageForgotPassword == errorMessageForgotPassword)&&(identical(other.statusResetPassword, statusResetPassword) || other.statusResetPassword == statusResetPassword)&&(identical(other.errorMessageReset, errorMessageReset) || other.errorMessageReset == errorMessageReset)&&(identical(other.statusSendEmail, statusSendEmail) || other.statusSendEmail == statusSendEmail)&&(identical(other.errorMessageSendEmail, errorMessageSendEmail) || other.errorMessageSendEmail == errorMessageSendEmail));
}


@override
int get hashCode => Object.hash(runtimeType,statusForgotPassword,errorMessageForgotPassword,statusResetPassword,errorMessageReset,statusSendEmail,errorMessageSendEmail);

@override
String toString() {
  return 'ForgotPasswordState(statusForgotPassword: $statusForgotPassword, errorMessageForgotPassword: $errorMessageForgotPassword, statusResetPassword: $statusResetPassword, errorMessageReset: $errorMessageReset, statusSendEmail: $statusSendEmail, errorMessageSendEmail: $errorMessageSendEmail)';
}


}

/// @nodoc
abstract mixin class _$ForgotPasswordStateCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$ForgotPasswordStateCopyWith(_ForgotPasswordState value, $Res Function(_ForgotPasswordState) _then) = __$ForgotPasswordStateCopyWithImpl;
@override @useResult
$Res call({
 Status statusForgotPassword, String? errorMessageForgotPassword, Status statusResetPassword, String? errorMessageReset, Status statusSendEmail, String? errorMessageSendEmail
});




}
/// @nodoc
class __$ForgotPasswordStateCopyWithImpl<$Res>
    implements _$ForgotPasswordStateCopyWith<$Res> {
  __$ForgotPasswordStateCopyWithImpl(this._self, this._then);

  final _ForgotPasswordState _self;
  final $Res Function(_ForgotPasswordState) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusForgotPassword = null,Object? errorMessageForgotPassword = freezed,Object? statusResetPassword = null,Object? errorMessageReset = freezed,Object? statusSendEmail = null,Object? errorMessageSendEmail = freezed,}) {
  return _then(_ForgotPasswordState(
statusForgotPassword: null == statusForgotPassword ? _self.statusForgotPassword : statusForgotPassword // ignore: cast_nullable_to_non_nullable
as Status,errorMessageForgotPassword: freezed == errorMessageForgotPassword ? _self.errorMessageForgotPassword : errorMessageForgotPassword // ignore: cast_nullable_to_non_nullable
as String?,statusResetPassword: null == statusResetPassword ? _self.statusResetPassword : statusResetPassword // ignore: cast_nullable_to_non_nullable
as Status,errorMessageReset: freezed == errorMessageReset ? _self.errorMessageReset : errorMessageReset // ignore: cast_nullable_to_non_nullable
as String?,statusSendEmail: null == statusSendEmail ? _self.statusSendEmail : statusSendEmail // ignore: cast_nullable_to_non_nullable
as Status,errorMessageSendEmail: freezed == errorMessageSendEmail ? _self.errorMessageSendEmail : errorMessageSendEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
