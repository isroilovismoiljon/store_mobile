import 'package:equatable/equatable.dart';
import 'package:store_mobile/core/constants/status.dart';
import '../../../data/models/address/address_model.dart';

class AddressState extends Equatable {
  final String? errorMessageAddress;
  final List<AddressModel> addresses;
  final Status addressStatus, newAddressStatus;
  final int? selectedIndex;

  const AddressState({
    required this.errorMessageAddress,
    required this.addresses,
    required this.addressStatus,
    required this.selectedIndex,
    required this.newAddressStatus,
  });

  factory AddressState.initial() => const AddressState(
    errorMessageAddress: null,
    addresses: [],
    addressStatus: Status.idle,
    selectedIndex: null,
    newAddressStatus: Status.idle,
  );

  AddressState copyWith({
    String? errorMessageAddress,
    List<AddressModel>? addresses,
    Status? addressStatus,
    int? selectedIndex,
    Status? newAddressStatus,
  }) {
    return AddressState(
      errorMessageAddress: errorMessageAddress ?? this.errorMessageAddress,
      addresses: addresses ?? this.addresses,
      addressStatus: addressStatus ?? this.addressStatus,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      newAddressStatus: newAddressStatus ?? this.newAddressStatus,
    );
  }

  @override
  List<Object?> get props => [errorMessageAddress, addresses, addressStatus, selectedIndex,newAddressStatus];
}
