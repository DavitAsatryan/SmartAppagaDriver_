import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:login_register_token/Cubit/Internet/cubit/internet_cubit.dart';
import 'package:login_register_token/Enum/internetEnum.dart';

import '../../repository.dart';
import '../Auth_Bloc/bloc/auth_bloc.dart';

part 'order_event.dart';
part 'order_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final InternetCubit internetCubit;
  //late StreamSubscription internetStreamSubscription;
  static var orderAPI = 'https://jsonplaceholder.typicode.com/posts';
  UserRepository repository;
  AuthBloc authenticationBloc;

  List<OrderModel> orders = [];

  // void data() {
  //   repository.orderMassage().then((value) {
  //     orders.addAll(value);
  //   });
  // }

  ListBloc({
    required this.authenticationBloc,
    required this.repository,
    required this.internetCubit,
  }) : super(InitialState()) {
    on<ListEvent>((event, emit) async {
      if (event is FetchEvent) {
        print("fetchEvent ____");
        emit(LoadingState());
        try {
          await repository.orderMassage().then((value) {
            orders.addAll(value);
          });
          emit(FetchSuccses(orders: orders));
        } catch (e) {
          emit(ErrorState(e.toString()));
        }
      } else if (event is SectionButtonPressed) {
        print("SectionButtonPressed  ____");
        emit(LoadingState());
        try {
          orders = await repository.ordersListGet(orderAPI);
          emit(SectionsSuccses(orders: orders));
        } catch (e) {
          emit(ErrorState(e.toString()));
        }
      }
      //   if (event is UnassignedEvent) {
      //   print("Չկատարված ____");
      //   emit(LoadingState());
      //   try {
      //     orders = await repository.ordersListGet(orderAPI);
      //     emit(UnassignedSuccses(orders: orders));
      //   } catch (e) {
      //     emit(ErrorState(e.toString()));
      //   }
      if (event is AssignedEvent) {
        print("Իմ հավաքները ____");
        emit(LoadingState());
        try {
          orders = await repository.ordersListGet(orderAPI);
          emit(AssignedSuccses(orders: orders));
        } catch (e) {
          emit(ErrorState(e.toString()));
        }
      } else if (event is CompletedEvent) {
        print("Ավարտված ____");
        emit(LoadingState());
        try {
          orders = await repository.ordersListGet(orderAPI);
          emit(CompletedSuccses(orders: orders));
        } catch (e) {
          emit(ErrorState(e.toString()));
        }
      } else if (event is IncompleteEvent) {
        print("Չկատարված ____");
        emit(LoadingState());
        try {
          orders = await repository.ordersListGet(orderAPI);
          emit(IncompleteSuccses(orders: orders));
        } catch (e) {
          emit(ErrorState(e.toString()));
        }
      } else if (event is MissedEvent) {
        print("Բաց թողնված ____");
        emit(LoadingState());
        try {
          orders = await repository.ordersListGet(orderAPI);
          emit(MissedSuccses(orders: orders));
        } catch (e) {
          emit(ErrorState(e.toString()));
        }
      }
      // await monitorInternetBlocCubit(event, emit);
    });
  }

  Future<StreamSubscription<InternetState>> monitorInternetBlocCubit(
      StreamSubscription internetStreamSubscription,
      ListEvent event,
      Emitter<ListState> emit) async {
    return internetStreamSubscription =
        internetCubit.stream.listen((internetState) async {
      if (internetState is InternetConnected &&
          internetState.connectionTYpe == ConnectionType.Wifi) {}
    });
  }

  // @override
  // Future<void> close() {
  //   ListBloc(
  //     authenticationBloc: authenticationBloc,
  //     internetCubit: internetCubit,
  //     repository: repository,
  //   ).close();
  //   return super.close();
  // }
}
