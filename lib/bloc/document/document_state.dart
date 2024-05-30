part of 'document_bloc.dart';

sealed class DocumentState extends Equatable {
  const DocumentState();
  
  @override
  List<Object> get props => [];
}

final class DocumentInitial extends DocumentState {}
