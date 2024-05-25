import 'package:dashboard/bloc/sample_bloc/sample_event.dart';
import 'package:dashboard/bloc/sample_bloc/sample_state.dart';
import 'package:dashboard/data%20copy/services/sample_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  final MsSampleService msSampleService;

  SampleBloc({required this.msSampleService}) : super(const InitialState()) {
    on<FetchAllSampleData>(
      (_, emit) async {
        emit(SampleLoading());
        try {
          final result = await msSampleService.getAllSample();
          emit(FetchAllSampleSuccess(result));
        } catch (e) {
          emit(FetchAllSampleError(e.toString()));
        }
      },
    );
  }
}
