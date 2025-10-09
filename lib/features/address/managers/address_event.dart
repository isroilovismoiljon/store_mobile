
import '../../../data/models/address/add_address_model.dart';

sealed class AddressEvent {}

final class AddressGetAllEvent extends AddressEvent {}

final class SelectAddressEvent extends AddressEvent {
  final int selectedIndex;

  SelectAddressEvent(this.selectedIndex);
}

final class AddAddressEvent extends AddressEvent {
  final AddAddressModel data;

  AddAddressEvent(this.data);
}
