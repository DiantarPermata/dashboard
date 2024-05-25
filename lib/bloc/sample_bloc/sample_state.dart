import 'package:dashboard/data%20copy/models/sample_model.dart';
import 'package:equatable/equatable.dart';

abstract class SampleState extends Equatable {
  const SampleState();
  @override
  List<Object> get props => [];
}

class InitialState extends SampleState {
  const InitialState() : super();
  @override
  List<Object> get props => [];
}

class SampleLoading extends SampleState {}

class FetchAllSampleSuccess extends SampleState {
  final MsSampleData data;
  const FetchAllSampleSuccess(this.data) : super();
  @override
  List<Object> get props => [];
}

class FetchAllSampleError extends SampleState {
  final String message;
  const FetchAllSampleError(this.message) : super();
  @override
  List<Object> get props => [];
}
