import 'package:meta/meta.dart';

@immutable
class SearchState {
  final bool isWordEntered;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  SearchState({
    @required this.isWordEntered,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory SearchState.initial(){
    return SearchState(
      isWordEntered: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory SearchState.entry(){
    return SearchState(
      isWordEntered: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory SearchState.loading(){
    return SearchState(
      isWordEntered: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory SearchState.success(){
    return SearchState(
      isWordEntered: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  factory SearchState.failure(){
    return SearchState(
      isWordEntered: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  SearchState update({
    bool isWordEntered,
  }) {
    return copyWith(
      isWordEntered: isWordEntered,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  SearchState copyWith({
    bool isWordEntered,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return SearchState(
      isWordEntered: isWordEntered ?? this.isWordEntered,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  String toString() {
    return '''SearchState {
      isWordEntered: $isWordEntered,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}