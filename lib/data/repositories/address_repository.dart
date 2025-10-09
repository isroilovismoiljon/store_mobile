import '../../core/network/client.dart';
import '../../core/utils/result.dart';
import '../models/address/add_address_model.dart';
import '../models/address/address_model.dart';

class AddressRepository {
  AddressRepository({
    required ApiClient client,
  }) : _client = client;

  final ApiClient _client;

  Future<Result<List<AddressModel>>> getAddress() async {
    var response = await _client.get<List>("/addresses/list");
    return response.fold(
          (error) => Result.error(error),
          (value) => Result.ok(value.map((item) => AddressModel.fromJson(item)).toList()),
    );
  }

  Future<Result<void>> postNewAddress(AddAddressModel data) async {
    var response = await _client.post("/addresses/create", data: data.toJson());
    return response.fold(
          (error) => Result.error(error),
          (success) => Result.ok(null),
    );
  }
}