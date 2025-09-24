// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_items_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartItemsState {

 CartItemModel? get cartItems; Status get statusCartItem; String? get errorMessageCartItem;
/// Create a copy of CartItemsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemsStateCopyWith<CartItemsState> get copyWith => _$CartItemsStateCopyWithImpl<CartItemsState>(this as CartItemsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItemsState&&(identical(other.cartItems, cartItems) || other.cartItems == cartItems)&&(identical(other.statusCartItem, statusCartItem) || other.statusCartItem == statusCartItem)&&(identical(other.errorMessageCartItem, errorMessageCartItem) || other.errorMessageCartItem == errorMessageCartItem));
}


@override
int get hashCode => Object.hash(runtimeType,cartItems,statusCartItem,errorMessageCartItem);

@override
String toString() {
  return 'CartItemsState(cartItems: $cartItems, statusCartItem: $statusCartItem, errorMessageCartItem: $errorMessageCartItem)';
}


}

/// @nodoc
abstract mixin class $CartItemsStateCopyWith<$Res>  {
  factory $CartItemsStateCopyWith(CartItemsState value, $Res Function(CartItemsState) _then) = _$CartItemsStateCopyWithImpl;
@useResult
$Res call({
 CartItemModel? cartItems, Status statusCartItem, String? errorMessageCartItem
});




}
/// @nodoc
class _$CartItemsStateCopyWithImpl<$Res>
    implements $CartItemsStateCopyWith<$Res> {
  _$CartItemsStateCopyWithImpl(this._self, this._then);

  final CartItemsState _self;
  final $Res Function(CartItemsState) _then;

/// Create a copy of CartItemsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cartItems = freezed,Object? statusCartItem = null,Object? errorMessageCartItem = freezed,}) {
  return _then(_self.copyWith(
cartItems: freezed == cartItems ? _self.cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as CartItemModel?,statusCartItem: null == statusCartItem ? _self.statusCartItem : statusCartItem // ignore: cast_nullable_to_non_nullable
as Status,errorMessageCartItem: freezed == errorMessageCartItem ? _self.errorMessageCartItem : errorMessageCartItem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartItemsState].
extension CartItemsStatePatterns on CartItemsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItemsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItemsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItemsState value)  $default,){
final _that = this;
switch (_that) {
case _CartItemsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItemsState value)?  $default,){
final _that = this;
switch (_that) {
case _CartItemsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CartItemModel? cartItems,  Status statusCartItem,  String? errorMessageCartItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItemsState() when $default != null:
return $default(_that.cartItems,_that.statusCartItem,_that.errorMessageCartItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CartItemModel? cartItems,  Status statusCartItem,  String? errorMessageCartItem)  $default,) {final _that = this;
switch (_that) {
case _CartItemsState():
return $default(_that.cartItems,_that.statusCartItem,_that.errorMessageCartItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CartItemModel? cartItems,  Status statusCartItem,  String? errorMessageCartItem)?  $default,) {final _that = this;
switch (_that) {
case _CartItemsState() when $default != null:
return $default(_that.cartItems,_that.statusCartItem,_that.errorMessageCartItem);case _:
  return null;

}
}

}

/// @nodoc


class _CartItemsState implements CartItemsState {
  const _CartItemsState({required this.cartItems, required this.statusCartItem, required this.errorMessageCartItem});
  

@override final  CartItemModel? cartItems;
@override final  Status statusCartItem;
@override final  String? errorMessageCartItem;

/// Create a copy of CartItemsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemsStateCopyWith<_CartItemsState> get copyWith => __$CartItemsStateCopyWithImpl<_CartItemsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItemsState&&(identical(other.cartItems, cartItems) || other.cartItems == cartItems)&&(identical(other.statusCartItem, statusCartItem) || other.statusCartItem == statusCartItem)&&(identical(other.errorMessageCartItem, errorMessageCartItem) || other.errorMessageCartItem == errorMessageCartItem));
}


@override
int get hashCode => Object.hash(runtimeType,cartItems,statusCartItem,errorMessageCartItem);

@override
String toString() {
  return 'CartItemsState(cartItems: $cartItems, statusCartItem: $statusCartItem, errorMessageCartItem: $errorMessageCartItem)';
}


}

/// @nodoc
abstract mixin class _$CartItemsStateCopyWith<$Res> implements $CartItemsStateCopyWith<$Res> {
  factory _$CartItemsStateCopyWith(_CartItemsState value, $Res Function(_CartItemsState) _then) = __$CartItemsStateCopyWithImpl;
@override @useResult
$Res call({
 CartItemModel? cartItems, Status statusCartItem, String? errorMessageCartItem
});




}
/// @nodoc
class __$CartItemsStateCopyWithImpl<$Res>
    implements _$CartItemsStateCopyWith<$Res> {
  __$CartItemsStateCopyWithImpl(this._self, this._then);

  final _CartItemsState _self;
  final $Res Function(_CartItemsState) _then;

/// Create a copy of CartItemsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cartItems = freezed,Object? statusCartItem = null,Object? errorMessageCartItem = freezed,}) {
  return _then(_CartItemsState(
cartItems: freezed == cartItems ? _self.cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as CartItemModel?,statusCartItem: null == statusCartItem ? _self.statusCartItem : statusCartItem // ignore: cast_nullable_to_non_nullable
as Status,errorMessageCartItem: freezed == errorMessageCartItem ? _self.errorMessageCartItem : errorMessageCartItem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
