import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block_todo/api/fuctions.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchDataEvent>(fechData);
    on<FormNativeEvent>(fechNavigation);
    on<ShowDialogEvent>(showDialog);
    on<DeleteEvent>(deleteEvent);
    on<UpdateNavigationEvent>(updataEvent);
  }

  FutureOr<void> fechNavigation(
      FormNativeEvent event, Emitter<HomeState> emit) async {
    emit(NavigationState());
  }

  FutureOr<void> fechData(FetchDataEvent event, Emitter<HomeState> emit) async {
    emit(Loading());
    final todo = await Api.fetchdata();
    if (todo!.isNotEmpty) {
      emit(Success(todoList: todo));
    } else {
      emit(ErrorState());
    }
  }

  FutureOr<void> showDialog(ShowDialogEvent event, Emitter<HomeState> emit) {
    emit(ShowPopState());
  }

  FutureOr<void> deleteEvent(DeleteEvent event, Emitter<HomeState> emit) {
    Api.deletid(event.id);
    emit (DatadeleteState());
  }



  FutureOr<void> updataEvent(UpdateNavigationEvent event, Emitter<HomeState> emit) {
 UpdateNavigtaionState(id: event.id, map: event.map);
  }
}
