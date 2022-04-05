part of 'main_page_bloc.dart';

abstract class MainPageEvent extends Equatable {
  const MainPageEvent();

  @override
  List<Object> get props => [];
}

class MainPageStarted extends MainPageEvent {}

class MainPageChangeCurrentMainPage extends MainPageEvent {
  // Members
  final MainView currentMainPage;

  // Constructors
  const MainPageChangeCurrentMainPage(this.currentMainPage);

  @override
  List<Object> get props => [currentMainPage];
}
