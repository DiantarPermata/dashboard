import 'package:equatable/equatable.dart';

abstract class SampleEvent extends Equatable {
  const SampleEvent();
  @override
  List<Object> get props => [];
}

class FetchAllSampleData extends SampleEvent {
  const FetchAllSampleData();

  @override
  List<Object> get props => [];
}
