import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_todo/api/fuctions.dart';


part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(AddIntial()) {
    on<AddTodoEvent>(addtodo);
  }

  FutureOr<void> addtodo(event, Emitter<AddState> emit) async{
   final isSucces= await Api.addtodo(event.id);
   if(isSucces){
    emit (AddTodoSuccessState());

   }else{
    emit(AddTodoErrorState());
   }
  }
}

