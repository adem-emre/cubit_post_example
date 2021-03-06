import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit(
    {
      required this.connectivity
    }
  ) : super(InternetInitial()){
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((connectivityResult) { 

      if(connectivityResult == ConnectivityResult.wifi){
        emit(const InternetConnected(connectionType: ConnectionType.wifi));
      }else if(connectivityResult == ConnectivityResult.mobile){
        emit(const InternetConnected(connectionType: ConnectionType.mobile));
      }else if(connectivityResult == ConnectivityResult.none){
        emit(InternetDisconnected());
      }

    });
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
  
}
