import '../../core/network/client.dart';
import '../../core/utils/result.dart';
import '../models/card/add_card_model.dart';
import '../models/card/card_model.dart';

class CardRepository {
  CardRepository({
    required ApiClient client,
  }) : _client = client;
  final ApiClient _client;

  Future<Result<List<CardModel>>> getCards()async{
    var response = await _client.get<List>("/cards/list");
    return response.fold(
          (error) => Result.error(error),
          (value) => Result.ok(value.map((item)=> CardModel.fromJson(item)).toList()),
    );
  }

  Future<Result<void>> postCardAdd(AddCardModel data) async {
    var response = await _client.post("/cards/create", data: data.toJson());
    return response.fold(
          (error) => Result.error(error),
          (success) => Result.ok(null),
    );
  }
}
