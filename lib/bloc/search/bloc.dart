

import 'package:bloc/bloc.dart';
import 'package:vasitionary/bloc/search/state.dart';
import 'package:vasitionary/helper/Validators.dart';

import 'event.dart';

class SearchBloc extends  Bloc<SearchEvent, SearchState> {

  @override
  void onTransition(Transition<SearchEvent, SearchState> transition) {
    print(transition);
  }

  @override
  Stream<SearchState> mapEventToState(
      SearchEvent event,
      ) async* {
      if(event is TextChanged){
        yield* _textChange(event.text);
      }
      if (event is SearchReset) {
        yield SearchState.initial();
      }
  }

  @override
  SearchState get initialState => SearchState.initial();

  Stream<SearchState> _textChange(String word) async* {
    yield currentState.update(
      isWordEntered: Validators.isTextEntered(word),
    );
  }

}

