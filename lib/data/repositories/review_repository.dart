
import '../../core/network/client.dart';
import '../../core/utils/result.dart';
import '../models/review/review_model.dart';

class ReviewRepository {
  ReviewRepository({
    required ApiClient client,
  }) : _client = client;
  final ApiClient _client;

  Future<Result<List<ReviewModel>>> getReviews({required int id}) async {
    var response = await _client.get<List>("/reviews/list/$id");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(val.map((item) => ReviewModel.fromJson(item)).toList()),
    );
  }
}
