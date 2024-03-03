import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'copy_state.dart';

class CopyCubit extends Cubit<CopyState> {
  CopyCubit() : super(CopyInitial());
  void copy(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}
