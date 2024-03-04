part of 'copy_cubit.dart';

sealed class CopyState extends Equatable {
  const CopyState();

  @override
  List<Object> get props => [];
}

final class CopyInitial extends CopyState {}

class CopiedToClipboard extends CopyState {
  final String copiedText;
  const CopiedToClipboard(String text, {required this.copiedText});
   @override
  List<Object> get props => [copiedText];
}

