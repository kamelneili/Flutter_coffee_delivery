import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/app_router.dart';
import 'package:kamelfoodapp/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:kamelfoodapp/blocs/autocomplete/autocomplete_event.dart';
import 'package:kamelfoodapp/blocs/basket/basket_bloc.dart';
import 'package:kamelfoodapp/blocs/filters/filters_bloc.dart';
import 'package:kamelfoodapp/blocs/filters/filters_event.dart';
import 'package:kamelfoodapp/blocs/geolocation/geolocation_bloc.dart';
import 'package:kamelfoodapp/blocs/geolocation/geolocation_event.dart';
import 'package:kamelfoodapp/blocs/wishlist/wishlist_bloc.dart';
import 'package:kamelfoodapp/blocs/wishlist/wishlist_event.dart';
import 'package:kamelfoodapp/config/theme.dart';
import 'package:kamelfoodapp/repositories/geolocation/geolocation_repository.dart';
import 'package:kamelfoodapp/repositories/places/places_repository.dart';
import 'package:kamelfoodapp/screens/basket/basket_screen.dart';
import 'package:kamelfoodapp/screens/filter/filter_screen.dart';
import 'package:kamelfoodapp/screens/home/home_screen.dart';
import 'package:kamelfoodapp/screens/location/location_screen.dart';
import 'package:kamelfoodapp/screens/restaurant_details/restaurant_details_screen.dart';
import 'package:kamelfoodapp/screens/splash/splash_screen.dart';
import 'package:kamelfoodapp/simple_bloc_observer.dart';

void main() async {
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(appRouter: AppRouter()));
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
          create: (_) => GeolocationRepository(),
        ),
        RepositoryProvider<PlacesRepository>(
          create: (_) => PlacesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GeolocationBloc(
                  geolocationRepository: context.read<GeolocationRepository>())
                ..add(LoadGeolocation())),
          BlocProvider(
              create: (context) => AutocompleteBloc(
                  placesRepository: context.read<PlacesRepository>())
                ..add(LoadAutocomplete())),
          BlocProvider(create: (context) => FiltersBloc()..add(LoadFilter())),
          BlocProvider(create: (context) => BasketBloc()..add(StartBasket())),
          BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        ],
        child: MaterialApp(
          onGenerateRoute: appRouter.generateRoute,
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
