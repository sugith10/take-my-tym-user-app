part of 'money_bloc.dart';

abstract class MoneyState extends Equatable {
  const MoneyState();  

  @override
  List<Object> get props => [];
}
class MoneyInitial extends MoneyState {}
