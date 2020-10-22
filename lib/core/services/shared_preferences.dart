import 'dart:convert';
import 'package:pet_adoption/core/keywords/shared_preferences.dart';
import 'package:pet_adoption/core/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsFunctions {
  SharedPreferences _preferences;

  Future<void> storeUserModel(UserModel userModel) async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
    _preferences.setString(
      PrefsKeyWords.userModel,
      jsonEncode(
        UserModel.fromJson(
          UserModel().toJson(),
        ),
      ),
    );
  }

  Future<void> getUserModel() async {
    _preferences = await SharedPreferences.getInstance();
    if(_preferences.containsKey(PrefsKeyWords.userModel)){
      final userPrefsInfo =
      jsonDecode(_preferences.getString(PrefsKeyWords.userModel));
      UserModel _userModel = UserModel();
      _userModel.userId = userPrefsInfo[PrefsKeyWords.userId];
      _userModel.photoUrl = userPrefsInfo[PrefsKeyWords.photoUrl];
      _userModel.displayName = userPrefsInfo[PrefsKeyWords.displayName];
      _userModel.email = userPrefsInfo[PrefsKeyWords.email];
    }
  }
}
