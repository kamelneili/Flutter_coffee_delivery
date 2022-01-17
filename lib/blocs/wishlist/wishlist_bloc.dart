import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/blocs/wishlist/wishlist_event.dart';
import 'package:kamelfoodapp/blocs/wishlist/wishlist_state.dart';
import 'package:kamelfoodapp/models/wishlist_model.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>(_onStartWishlist);
    on<AddWishlistProduct>(_onAddWishlistProduct);
    //  on<RemoveWishlistProduct>(_onRemoveWishlistProduct);
  }
  void _onStartWishlist(
    StartWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(
        WishlistLoaded(),
      );
    } catch (_) {}
  }

  void _onAddWishlistProduct(
    AddWishlistProduct event,
    Emitter<WishlistState> emit,
  ) async {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
              wishlist: Wishlist(
                  products: List.from(state.wishlist.products)
                    ..add(event.product))),
        );
      } catch (_) {}
    }
  }

  // WishlistBloc() : super(WishlistLoading());
  // @override
  // Stream<WishlistState> mapEventToState(
  //   WishlistEvent event,
  // ) async* {
  //   if (event is StartWishlist) {
  //     yield* _mapStartWishlistToState();
  //   } else if (event is AddWishlistProduct) {
  //     yield* _mapAddtWishlistProductToState(event, state);
  //   } else if (event is RemoveWishlistProduct) {
  //     yield* _mapRemoveWishlistProductToState(event, state);
  //   }
  // }

  // Stream<WishlistState> _mapStartWishlistToState() async* {
  //   yield WishlistLoading();
  //   try {
  //     await Future<void>.delayed(Duration(seconds: 1));
  //     yield const WishlistLoaded();
  //   } catch (_) {}
  // }

  // Stream<WishlistState> _mapAddtWishlistProductToState(
  //   AddWishlistProduct event,
  //   WishlistState state,
  // ) async* {
  //   if (state is WishlistLoaded) {
  //     try {
  //       yield WishlistLoaded(
  //           wishlist: Wishlist(
  //               products: List.from(state.wishlist.products)
  //                 ..add(event.product)));
  //     } catch (_) {}
  //   }
  // }

  // Stream<WishlistState> _mapRemoveWishlistProductToState(
  //   RemoveWishlistProduct event,
  //   WishlistState state,
  // ) async* {
  //   if (state is WishlistLoaded) {
  //     try {
  //       yield WishlistLoaded(
  //           wishlist: Wishlist(
  //               products: List.from(state.wishlist.products)
  //                 ..remove(event.product)));
  //     } catch (_) {}
  //   }
  // }
}
