import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_register_token/repository.dart';

import '../../../Cubit/cubit/acceptfinish_cubit.dart';
import '../../../bloc/Auth_Bloc/bloc/auth_bloc.dart';
import '../../../bloc/Confirm/bloc/confirm_bloc.dart';
import '../../../bloc/Order_bloc/order_bloc.dart';
import '../../../bloc/QrCodeSend/bloc/qr_send_bloc.dart';
import '../../QR_code/qr_code.dart';
import 'AboutMore.dart';

class ListPickUps extends StatefulWidget {
  final controller;
  bool dd;
  ListPickUps({Key? key, required this.controller, required this.dd})
      : super(key: key);

  @override
  State<ListPickUps> createState() =>
      _ListPickUpsState(controller: controller, dd: dd);
}

class _ListPickUpsState extends State<ListPickUps> {
  final controller;
  bool dd;
  _ListPickUpsState({required this.controller, required this.dd});
  _onAcceptFinishButtonPressed(String text) {
    BlocProvider.of<AcceptfinishCubit>(context).acceptFinishMetod(text);
  }

  _onConfirmButtonPressed() {
    BlocProvider.of<ConfirmBloc>(context).add(
      const ConfirmButtonPressed(
        confirmText: "Confirm send to backend",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<ListBloc, ListState>(builder: (context, state) {
        if (state is InitialState) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.green));
        } else if (state is LoadingState) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.green));
        } else if (state is FetchSuccses) {
          return Container(child: Text("sssss")
              // gridViewOrder(state, state.orders.length, state.orders),
              );
        } else if (state is SectionsSuccses) {
          return Container(child: Text("sssss")
              // gridViewOrder(state, state.orders.length, state.orders),
              );
        }

        //  else if (state is UnassignedSuccses) {
        //   return Container(
        //       child: gridViewOrder(
        //           state, state.orders.length, state.orders));
        // } else if (state is AssignedSuccses) {
        //   return Container(
        //       child: gridViewOrder(
        //           state, state.orders.length, state.orders));
        // } else if (state is CanceledSuccses) {
        //   return Container(
        //       child: gridViewOrder(
        //           state, state.orders.length, state.orders));
        // } else if (state is CompletedSuccses) {
        //   return Container(
        //       child: gridViewOrder(
        //           state, state.orders.length, state.orders));
        // } else if (state is IncompleteSuccses) {
        //   return Container(
        //       child: gridViewOrder(
        //           state, state.orders.length, state.orders));
        // } else if (state is MissedSuccses) {
        //   return Container(
        //       child: gridViewOrder(
        //           state, state.orders.length, state.orders));
        // }
        return Container(
          child: const Center(child: Text("Data Is Empty")),
        );
      }),
    );

    //  Container(
    //   child: BlocBuilder<ListBloc, ListState>(builder: (context, state) {
    //     if (state is InitialState) {
    //       return const Center(
    //           child: CircularProgressIndicator(color: Colors.green));
    //     } else if (state is LoadingState) {
    //       return const Center(
    //           child: CircularProgressIndicator(color: Colors.green));
    //     } else if (state is FetchSuccses) {
    //       return Container(
    //         child: gridViewOrder(state, state.orders.length, state.orders),
    //       );
    //     } else if (state is SectionsSuccses) {
    //       return Container(
    //         child: gridViewOrder(state, state.orders.length, state.orders),
    //       );
    //     }

    //     //  else if (state is UnassignedSuccses) {
    //     //   return Container(
    //     //       child: gridViewOrder(
    //     //           state, state.orders.length, state.orders));
    //     // } else if (state is AssignedSuccses) {
    //     //   return Container(
    //     //       child: gridViewOrder(
    //     //           state, state.orders.length, state.orders));
    //     // } else if (state is CanceledSuccses) {
    //     //   return Container(
    //     //       child: gridViewOrder(
    //     //           state, state.orders.length, state.orders));
    //     // } else if (state is CompletedSuccses) {
    //     //   return Container(
    //     //       child: gridViewOrder(
    //     //           state, state.orders.length, state.orders));
    //     // } else if (state is IncompleteSuccses) {
    //     //   return Container(
    //     //       child: gridViewOrder(
    //     //           state, state.orders.length, state.orders));
    //     // } else if (state is MissedSuccses) {
    //     //   return Container(
    //     //       child: gridViewOrder(
    //     //           state, state.orders.length, state.orders));
    //     // }
    //     return Container(
    //       child: const Center(child: Text("Data Is Empty")),
    //     );
    //   }),
    // );
  }
}
