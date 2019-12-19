

import 'package:bloc/bloc.dart';
import 'package:vasitionary/bloc/search/state.dart';
import 'package:vasitionary/helper/Validators.dart';
import 'package:vasitionary/model/dictionary_word_list.dart';

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
      if(event is LoadData){
        yield SearchState.loadData();
        yield* _isDataLoaded();
      }
      if(event is Selected){
        yield* _wordSelected(event.text);
      }
      if(event is Submitting){
        yield* _wordSubmitting();
      }
  }

  @override
  SearchState get initialState => SearchState.initial();

  Stream<SearchState> _textChange(String word) async* {
    yield currentState.update(
      isWordEntered: Validators.isTextEntered(word),
    );
  }

  Stream<SearchState> _isDataLoaded() async* {
    yield currentState.update(
      isWordEntered: DictionaryWordList.wordList.length>0,
    );
  }

  Stream<SearchState> _wordSelected(String word) async* {
    yield currentState.update(
      isSubmitting: true,
      isSuccess: word.length>0,
      isFailure: word.length<=0,
    );
  }

  Stream<SearchState> _wordSubmitting() async* {
    yield currentState.update(
      isSubmitting: true,
    );
  }
  Stream<SearchState> _wordSubmitted() async* {
    yield currentState.update(
      isSubmitting: false,
    );
  }
}

