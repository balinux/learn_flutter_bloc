import 'package:bloc/bloc.dart';

class ThemeBloc extends Cubit<bool> {
  ThemeBloc({this.init = true}) : super(init);
  bool init;

  void changetheme() => emit(!state);

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    print(change);
  }
}
