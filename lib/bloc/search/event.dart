import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class SearchEvent extends Equatable {
  SearchEvent([List props = const []]) : super(props);
}

class TextChanged extends SearchEvent {
  final String text;

  TextChanged({@required this.text}) : super([text]);

  @override
  String toString() => 'EmailChanged { email :$text }';
}

class Submitted extends SearchEvent {
  final String text;

  Submitted({@required this.text})
      : super([text]);

  @override
  String toString() {
    return 'Submitted { Search Text: $text }';
  }
}

class SearchReset extends SearchEvent {

  SearchReset();

  @override
  String toString() {
    return 'Reset Success';
  }
}