part of 'main_page_bloc.dart';

abstract class MainPageState extends Equatable {
  const MainPageState();

  @override
  List<Object> get props => [];
}

class MainPageInitial extends MainPageState {}

class MainPageInProgress extends MainPageState {}

class MainPageLoadSuccess extends MainPageState {
  // Members
  final MainView? currentMainPage;

  // Constructors
  const MainPageLoadSuccess(this.currentMainPage);

  @override
  List<Object> get props => [currentMainPage!];
}

class MainPageLoadFailure extends MainPageState {
  // Members
  final dynamic error;

  // Constructors
  const MainPageLoadFailure(this.error);

  @override
  List<Object> get props => error;
}
