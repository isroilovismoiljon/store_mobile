// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyDetailsState implements DiagnosticableTreeMixin {

 Status get statusMyDetails; String? get errorMessageMyDetails;
/// Create a copy of MyDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyDetailsStateCopyWith<MyDetailsState> get copyWith => _$MyDetailsStateCopyWithImpl<MyDetailsState>(this as MyDetailsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MyDetailsState'))
    ..add(DiagnosticsProperty('statusMyDetails', statusMyDetails))..add(DiagnosticsProperty('errorMessageMyDetails', errorMessageMyDetails));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyDetailsState&&(identical(other.statusMyDetails, statusMyDetails) || other.statusMyDetails == statusMyDetails)&&(identical(other.errorMessageMyDetails, errorMessageMyDetails) || other.errorMessageMyDetails == errorMessageMyDetails));
}


@override
int get hashCode => Object.hash(runtimeType,statusMyDetails,errorMessageMyDetails);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MyDetailsState(statusMyDetails: $statusMyDetails, errorMessageMyDetails: $errorMessageMyDetails)';
}


}

/// @nodoc
abstract mixin class $MyDetailsStateCopyWith<$Res>  {
  factory $MyDetailsStateCopyWith(MyDetailsState value, $Res Function(MyDetailsState) _then) = _$MyDetailsStateCopyWithImpl;
@useResult
$Res call({
 Status statusMyDetails, String? errorMessageMyDetails
});




}
/// @nodoc
class _$MyDetailsStateCopyWithImpl<$Res>
    implements $MyDetailsStateCopyWith<$Res> {
  _$MyDetailsStateCopyWithImpl(this._self, this._then);

  final MyDetailsState _self;
  final $Res Function(MyDetailsState) _then;

/// Create a copy of MyDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusMyDetails = null,Object? errorMessageMyDetails = freezed,}) {
  return _then(_self.copyWith(
statusMyDetails: null == statusMyDetails ? _self.statusMyDetails : statusMyDetails // ignore: cast_nullable_to_non_nullable
as Status,errorMessageMyDetails: freezed == errorMessageMyDetails ? _self.errorMessageMyDetails : errorMessageMyDetails // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyDetailsState].
extension MyDetailsStatePatterns on MyDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _MyDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _MyDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status statusMyDetails,  String? errorMessageMyDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyDetailsState() when $default != null:
return $default(_that.statusMyDetails,_that.errorMessageMyDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status statusMyDetails,  String? errorMessageMyDetails)  $default,) {final _that = this;
switch (_that) {
case _MyDetailsState():
return $default(_that.statusMyDetails,_that.errorMessageMyDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status statusMyDetails,  String? errorMessageMyDetails)?  $default,) {final _that = this;
switch (_that) {
case _MyDetailsState() when $default != null:
return $default(_that.statusMyDetails,_that.errorMessageMyDetails);case _:
  return null;

}
}

}

/// @nodoc


class _MyDetailsState with DiagnosticableTreeMixin implements MyDetailsState {
  const _MyDetailsState({required this.statusMyDetails, required this.errorMessageMyDetails});
  

@override final  Status statusMyDetails;
@override final  String? errorMessageMyDetails;

/// Create a copy of MyDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyDetailsStateCopyWith<_MyDetailsState> get copyWith => __$MyDetailsStateCopyWithImpl<_MyDetailsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MyDetailsState'))
    ..add(DiagnosticsProperty('statusMyDetails', statusMyDetails))..add(DiagnosticsProperty('errorMessageMyDetails', errorMessageMyDetails));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyDetailsState&&(identical(other.statusMyDetails, statusMyDetails) || other.statusMyDetails == statusMyDetails)&&(identical(other.errorMessageMyDetails, errorMessageMyDetails) || other.errorMessageMyDetails == errorMessageMyDetails));
}


@override
int get hashCode => Object.hash(runtimeType,statusMyDetails,errorMessageMyDetails);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MyDetailsState(statusMyDetails: $statusMyDetails, errorMessageMyDetails: $errorMessageMyDetails)';
}


}

/// @nodoc
abstract mixin class _$MyDetailsStateCopyWith<$Res> implements $MyDetailsStateCopyWith<$Res> {
  factory _$MyDetailsStateCopyWith(_MyDetailsState value, $Res Function(_MyDetailsState) _then) = __$MyDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 Status statusMyDetails, String? errorMessageMyDetails
});




}
/// @nodoc
class __$MyDetailsStateCopyWithImpl<$Res>
    implements _$MyDetailsStateCopyWith<$Res> {
  __$MyDetailsStateCopyWithImpl(this._self, this._then);

  final _MyDetailsState _self;
  final $Res Function(_MyDetailsState) _then;

/// Create a copy of MyDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusMyDetails = null,Object? errorMessageMyDetails = freezed,}) {
  return _then(_MyDetailsState(
statusMyDetails: null == statusMyDetails ? _self.statusMyDetails : statusMyDetails // ignore: cast_nullable_to_non_nullable
as Status,errorMessageMyDetails: freezed == errorMessageMyDetails ? _self.errorMessageMyDetails : errorMessageMyDetails // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
