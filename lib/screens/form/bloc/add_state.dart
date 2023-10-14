part of 'add_bloc.dart';


sealed class AddState {}

final class AddActonState extends AddState {}

final class AddIntial extends AddState{}

final class AddTodoSuccessState extends AddActonState {}

final class AddTodoErrorState extends AddActonState{}
