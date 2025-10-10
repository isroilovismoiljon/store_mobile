import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/constants/status.dart';

import '../../../../data/repositories/card_repository.dart';
import 'card_event.dart';
import 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc({
    required CardRepository cardRepo,
  })  : _cardRepository = cardRepo,
        super(CardState.initial()) {
    on<GetAllCardsEvent>(_getAllCards);
    on<AddCardEvent>(_addCard);
    on<SelectCardEvent>(_selectCard);
    add(GetAllCardsEvent());
  }

  final CardRepository _cardRepository;

  Future<void> _getAllCards(GetAllCardsEvent event, Emitter<CardState> emit) async {
    emit(state.copyWith(statusCard: Status.loading));
    var result = await _cardRepository.getCards();
    result.fold(
          (error) => emit(state.copyWith(errorMessageCard: error.toString(), statusCard: Status.error)),
          (value) => emit(
        state.copyWith(
          cards: value,
          statusCard: Status.success,
          selectedCardId: value.isNotEmpty ? value.first.id : null,
        ),
      ),
    );
  }

  Future<void> _addCard(AddCardEvent event, Emitter<CardState> emit) async {
    emit(state.copyWith(statusCard: Status.idle, errorMessageCard: null));
    var result = await _cardRepository.addCard(event.data);
    result.fold(
          (error) => emit(state.copyWith(errorMessageCard: error.toString(), statusCard: Status.error)),
          (success) {
        add(GetAllCardsEvent());
      },
    );
  }

  void _selectCard(SelectCardEvent event, Emitter<CardState> emit) {
    emit(state.copyWith(selectedCardId: event.selectedId));
  }
}
