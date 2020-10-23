import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_adoption/core/keywords/api.dart';
import 'package:pet_adoption/core/models/user.dart';
import 'package:pet_adoption/core/services/shared_preferences.dart';

class LoginController {
  final String _apiKey = 'AIzaSyCMEFcYYsswdlK5hVOmn_PsPjw1cDjN9Vc';

  Future<UserModel> login(String email,String password)async{
    final String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_apiKey';
    UserModel _userModel = UserModel();
    final response = await http.post(
      url,
      body: jsonEncode(
        {
          UserKeywords.email: email,
          UserKeywords.password: password,
        },
      ),
    );
    final decodedResponse = jsonDecode(response.body);
    try {
      _userModel.message =
          decodedResponse['error']['message'].replaceAll('_', ' ');
    } catch (_) {
      _userModel.message = null;
      _userModel.email = decodedResponse[UserKeywords.email];
      _userModel.displayName = decodedResponse[UserKeywords.displayName];
      _userModel.photoUrl = decodedResponse[UserKeywords.photoUrl];
      _userModel.userId = decodedResponse[UserKeywords.localId];
      await PrefsFunctions().storeUserModel(_userModel);
    }
    return _userModel;
  }
}