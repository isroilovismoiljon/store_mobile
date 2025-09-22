// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavedState {

 Status get status; String? get errorMessage; Status get productsStatus; String? get errorMessageProducts; List<ProductModel> get products;
/// Create a copy of SavedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedStateCopyWith<SavedState> get copyWith => _$SavedStateCopyWithImpl<SavedState>(this as SavedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.productsStatus, productsStatus) || other.productsStatus == productsStatus)&&(identical(other.errorMessageProducts, errorMessageProducts) || other.errorMessageProducts == errorMessageProducts)&&const DeepCollectionEquality().equals(other.products, products));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,productsStatus,errorMessageProducts,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'SavedState(status: $status, errorMessage: $errorMessage, productsStatus: $productsStatus, errorMessageProducts: $errorMessageProducts, products: $products)';
}


}

/// @nodoc
abstract mixin class $SavedStateCopyWith<$Res>  {
  factory $SavedStateCopyWith(SavedState value, $Res Function(SavedState) _then) = _$SavedStateCopyWithImpl;
@useResult
$Res call({
 Status status, String? errorMessage, Status productsStatus, String? errorMessageProducts, List<ProductModel> products
});




}
/// @nodoc
class _$SavedStateCopyWithImpl<$Res>
    implements $SavedStateCopyWith<$Res> {
  _$SavedStateCopyWithImpl(this._self, this._then);

  final SavedState _self;
  final $Res Function(SavedState) _then;

/// Create a copy of SavedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = freezed,Object? productsStatus = null,Object? errorMessageProducts = freezed,Object? products = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,productsStatus: null == productsStatus ? _self.productsStatus : productsStatus // ignore: cast_nullable_to_non_nullable
as Status,errorMessageProducts: freezed == errorMessageProducts ? _self.errorMessageProducts : errorMessageProducts // ignore: cast_nullable_to_non_nullable
as String?,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedState].
extension SavedStatePatterns on SavedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedState value)  $default,){
final _that = this;
switch (_that) {
case _SavedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedState value)?  $default,){
final _that = this;
switch (_that) {
case _SavedState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status status,  String? errorMessage,  Status productsStatus,  String? errorMessageProducts,  List<ProductModel> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.productsStatus,_that.errorMessageProducts,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status status,  String? errorMessage,  Status productsStatus,  String? errorMessageProducts,  List<ProductModel> products)  $default,) {final _that = this;
switch (_that) {
case _SavedState():
return $default(_that.status,_that.errorMessage,_that.productsStatus,_that.errorMessageProducts,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status status,  String? errorMessage,  Status productsStatus,  String? errorMessageProducts,  List<ProductModel> products)?  $default,) {final _that = this;
switch (_that) {
case _SavedState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.productsStatus,_that.errorMessageProducts,_that.products);case _:
  return null;

}
}

}

/// @nodoc


class _SavedState implements SavedState {
  const _SavedState({required this.status, required this.errorMessage, required this.productsStatus, required this.errorMessageProducts, required final  List<ProductModel> products}): _products = products;
  

@override final  Status status;
@override final  String? errorMessage;
@override final  Status productsStatus;
@override final  String? errorMessageProducts;
 final  List<ProductModel> _products;
@override List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of SavedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedStateCopyWith<_SavedState> get copyWith => __$SavedStateCopyWithImpl<_SavedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.productsStatus, productsStatus) || other.productsStatus == productsStatus)&&(identical(other.errorMessageProducts, errorMessageProducts) || other.errorMessageProducts == errorMessageProducts)&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,productsStatus,errorMessageProducts,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'SavedState(status: $status, errorMessage: $errorMessage, productsStatus: $productsStatus, errorMessageProducts: $errorMessageProducts, products: $products)';
}


}

/// @nodoc
abstract mixin class _$SavedStateCopyWith<$Res> implements $SavedStateCopyWith<$Res> {
  factory _$SavedStateCopyWith(_SavedState value, $Res Function(_SavedState) _then) = __$SavedStateCopyWithImpl;
@override @useResult
$Res call({
 Status status, String? errorMessage, Status productsStatus, String? errorMessageProducts, List<ProductModel> products
});




}
/// @nodoc
class __$SavedStateCopyWithImpl<$Res>
    implements _$SavedStateCopyWith<$Res> {
  __$SavedStateCopyWithImpl(this._self, this._then);

  final _SavedState _self;
  final $Res Function(_SavedState) _then;

/// Create a copy of SavedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = freezed,Object? productsStatus = null,Object? errorMessageProducts = freezed,Object? products = null,}) {
  return _then(_SavedState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,productsStatus: null == productsStatus ? _self.productsStatus : productsStatus // ignore: cast_nullable_to_non_nullable
as Status,errorMessageProducts: freezed == errorMessageProducts ? _self.errorMessageProducts : errorMessageProducts // ignore: cast_nullable_to_non_nullable
as String?,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}


}

// dart format on
