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

class Selected extends SearchEvent {
  final String text;

  Selected({@required this.text})
      : super([text]);

  @override
  String toString() {
    return 'Selected { Search Text: $text }';
  }
}

class Submitting extends SearchEvent {

  Submitting();

  @override
  String toString() {
    return 'Selected { Search Text: }';
  }
}

class SearchReset extends SearchEvent {

  SearchReset();

  @override
  String toString() {
    return 'Reset Success';
  }
}

class LoadData extends SearchEvent {

  LoadData();

  @override
  String toString() {
    return 'Loading Data';
  }
}