import '../../../../data/models/card/add_card_model.dart';

sealed class CardEvent {}

final class GetAllCardsEvent extends CardEvent {}

final class AddCardEvent extends CardEvent {
  final AddCardModel data;

  AddCardEvent(this.data);
}

final class SelectCardEvent extends CardEvent {
  final int selectedId;

  SelectCardEvent(this.selectedId);
}
