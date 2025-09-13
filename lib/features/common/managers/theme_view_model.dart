import 'package:store_mobile/core/imports.dart';

class ThemeViewModel extends ChangeNotifier{
  ThemeMode mode = ThemeMode.light;
  void toggleTheme(){
    if (mode == ThemeMode.light) {
      mode = ThemeMode.dark;
    }  else{
      mode = ThemeMode.light;
    }
    notifyListeners();
  }
}