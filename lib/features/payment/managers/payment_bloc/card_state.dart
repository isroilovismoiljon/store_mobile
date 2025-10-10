import 'package:equatable/equatable.dart';
import '../../../../core/constants/status.dart';
import '../../../../data/models/card/card_model.dart';

class CardState extends Equatable {
  final String? errorMessageCard;
  final Status statusCard;
  final List<CardModel> cards;
  final int? selectedCardId;

  const CardState({
    required this.errorMessageCard,
    required this.statusCard,
    required this.cards,
    this.selectedCardId,
  });

  factory CardState.initial() {
    return const CardState(
      errorMessageCard: null,
      statusCard: Status.idle,
      cards: [],
      selectedCardId: null,
    );
  }

  CardState copyWith({
    String? errorMessageCard,
    Status? statusCard,
    List<CardModel>? cards,
    int? selectedCardId,
  }) {
    return CardState(
      errorMessageCard: errorMessageCard ?? this.errorMessageCard,
      statusCard: statusCard ?? this.statusCard,
      cards: cards ?? this.cards,
      selectedCardId: selectedCardId ?? this.selectedCardId,
    );
  }

  @override
  List<Object?> get props => [errorMessageCard, statusCard, cards, selectedCardId];
}
