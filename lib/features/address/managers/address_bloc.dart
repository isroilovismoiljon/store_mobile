

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/constants/status.dart';

import '../../../data/repositories/address_repository.dart';
import 'address_event.dart';
import 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository _addressRepository;

  AddressBloc({required AddressRepository addressRepository}) : _addressRepository = addressRepository, super(AddressState.initial()) {
    on<AddressGetAllEvent>(_getAllAddresses);
    on<SelectAddressEvent>(_selectAddress);
    on<AddAddressEvent>(_getNewAddress);
    add(AddressGetAllEvent());
  }

  Future<void> _getAllAddresses(AddressGetAllEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(addressStatus: Status.loading));
    final result = await _addressRepository.getAddress();

    result.fold(
      (error) => emit(state.copyWith(errorMessageAddress: error.toString(), addressStatus: Status.error)),
      (value) {
        int? defaultIndex = value.indexWhere((element) => element.isDefault == true);
        if (defaultIndex == -1) defaultIndex = null;

        emit(
          state.copyWith(addresses: value, addressStatus: Status.success, selectedIndex: defaultIndex),
        );
      },
    );
  }

  Future<void> _getNewAddress(AddAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(newAddressStatus: Status.loading, errorMessageAddress: null));
    var result = await _addressRepository.postNewAddress(event.data);
    result.fold(
      (error) => emit(state.copyWith(errorMessageAddress: error.toString(), newAddressStatus: Status.error)),
      (value) => emit(state.copyWith(newAddressStatus: Status.success)),
    );
  }

  void _selectAddress(SelectAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }
}
