import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goob_by_me/domain/models/models.dart';
import 'package:goob_by_me/domain/repositories/main_page_repository.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  // Members
  final MainPageRepository _mainPageRepository;

  // Constructors
  MainPageBloc({required MainPageRepository mainPageRepository})
      : _mainPageRepository = mainPageRepository,
        super(MainPageInitial());

  @override
  Stream<MainPageState> mapEventToState(MainPageEvent event) async* {
    try {
      yield MainPageInProgress();

      //MainView currentMainPage;

      if (event is MainPageStarted) {}

      yield MainPageLoadSuccess(null);
    } catch (error) {
      yield MainPageLoadFailure(error);
    }
  }
}
