import 'package:meta/meta.dart';

@immutable
class SearchState {
  final bool isDataLoaded;
  final bool isWordEntered;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  SearchState({
    @required this.isDataLoaded,
    @required this.isWordEntered,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory SearchState.loadData(){
    return SearchState(
      isDataLoaded: false,
      isWordEntered: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory SearchState.initial(){
    return SearchState(
      isDataLoaded: true,
      isWordEntered: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory SearchState.entry(){
    return SearchState(
      isDataLoaded: true,
      isWordEntered: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory SearchState.loading(){
    return SearchState(
      isDataLoaded: true,
      isWordEntered: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory SearchState.success(){
    return SearchState(
      isDataLoaded: true,
      isWordEntered: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  factory SearchState.failure(){
    return SearchState(
      isDataLoaded: true,
      isWordEntered: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  SearchState update({
    bool isWordEntered,
    bool isDataLoaded,
    bool isSuccess,
    bool isFailure,
    bool isSubmitting,
  }) {
    return copyWith(
      isDataLoaded: isDataLoaded,
      isWordEntered: isWordEntered,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      isFailure: isFailure,
    );
  }

  SearchState copyWith({
    bool isDataLoaded,
    bool isWordEntered,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return SearchState(
      isDataLoaded:isDataLoaded??this.isDataLoaded,
      isWordEntered: isWordEntered ?? this.isWordEntered,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  String toString() {
    return '''SearchState {
    isDataLoaded:$isDataLoaded,
      isWordEntered: $isWordEntered,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}