import 'package:flutter_bloc/flutter_bloc.dart';

class EnableButtonCubbit extends Cubit<bool> {
  EnableButtonCubbit() : super(false);

  void check(String? text) async {
    emit(text?.isNotEmpty == true);
  }
}
