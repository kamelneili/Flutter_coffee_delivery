import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kamelfoodapp/models/basket_model.dart';
import 'package:kamelfoodapp/models/delivery_time_model.dart';
import 'package:kamelfoodapp/models/menu_item_model.dart';
import 'package:kamelfoodapp/models/voucher_model.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoading()) {
    on<StartBasket>(_onStartBasket);
    on<AddItem>(_onAddItem);
    on<RemoveItem>(_onRemoveItem);
    on<RemoveAllItem>(_onRemoveAllItem);
    on<ToggleSwitch>(_onToggleSwitch);
    on<AddVoucher>(_onAddVoucher);
    on<SelectDeliveryTime>(_onSelectDeliveryTime);
  }
  void _onStartBasket(
    StartBasket event,
    Emitter<BasketState> emit,
  ) async {
    emit(BasketLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(
        BasketLoaded(
          basket: Basket(),
        ),
      );
    } catch (_) {}
  }

  void _onAddItem(
    AddItem event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(
              items: List.from(state.basket.items)..add(event.item),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  void _onRemoveItem(
    RemoveItem event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)..remove(event.item))));
      } catch (_) {}
    }
  }

  void _onRemoveAllItem(
    RemoveAllItem event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)
                  ..removeWhere((item) => item == event.item))));
      } catch (_) {}
    }
  }

  void _onToggleSwitch(
    ToggleSwitch event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(BasketLoaded(
            basket: state.basket.copyWith(cutlery: !state.basket.cutlery)));
      } catch (_) {}
    }
  }

  void _onAddVoucher(
    AddVoucher event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(BasketLoaded(
            basket: state.basket.copyWith(voucher: event.voucher)));
      } catch (_) {}
    }
  }

  void _onSelectDeliveryTime(
    SelectDeliveryTime event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(BasketLoaded(
            basket: state.basket.copyWith(deliveryTime: event.deliveryTime)));
      } catch (_) {}
    }
  }
}
  /*

  Stream<BasketState> mapEventToState(BasketEvent event) async* {
    if (event is StartBasket) {
      yield* _mapStartBasketToState();
    } else if (event is AddItem) {
      yield* _mapAddItemToState(event, state);
    } else if (event is RemoveItem) {
      yield* _mapRemoveItemToState(event, state);
    } else if (event is RemoveAllItem) {
      yield* _mapRemoveAllItemToState(event, state);
    } else if (event is ToggleSwitch) {
      yield* _mapToggleSwitchToState(event, state);
    } else if (event is AddVoucher) {
      yield* _mapAddVoucherToState(event, state);
    }
  }


  Stream<BasketState> _mapStartBasketToState() async* {
    yield BasketLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield BasketLoaded(basket: Basket());
    } catch (_) {}
  }

  Stream<BasketState> _mapAddItemToState(
      AddItem event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)..add(event.item)));
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapRemoveItemToState(
      RemoveItem event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)..remove(event.item)));
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapRemoveAllItemToState(
      RemoveAllItem event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)
                  ..removeWhere((item) => item == event.item)));
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapToggleSwitchToState(
    ToggleSwitch event,
    BasketState state,
  ) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(cutlery: !state.basket.cutlery));
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapAddVoucherToState(
      AddVoucher event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(voucher: event.voucher));
      } catch (_) {}
    }
  }
  
}
*/
