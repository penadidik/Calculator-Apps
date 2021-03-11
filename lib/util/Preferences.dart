//created by https://github.com/penadidik on March 7th 2021
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  // ignore: non_constant_identifier_names
  static String KEY_APP_NAME = "MVVMP Flutter";
  static String KEY_APISESS = "apisess";
  static String KEY_FIREBASE = "firebase";

  static String KEY_USER_ID = "id";
  static String KEY_USER_NAME = "name";
  static String KEY_USER_EMAIL = "email";
  static String KEY_USER_PICTURE = "user_picture";
  static String KEY_USER_ADDRESS = "address";
  static String KEY_USER_ACTIVE = "active";
  static String KEY_TELEPHONE = "telp";
  static String KEY_HISTORY = "history";
  static String KEY_GUEST = "guest";
  static String KEY_USER_PROFILE = "profile";

  static void setProfile(String profile) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(KEY_USER_PROFILE, profile);
  }

  static void setIsGuest(String guest) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(KEY_GUEST, guest);
  }

  static Future<String> getIsGuest() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return '${pref.getString(KEY_GUEST)}';
  }

  static void setId(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(KEY_USER_ID, id);
  }

  static Future<String> getId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return '${pref.getString(KEY_USER_ID)}';
  }

  static void setName(String name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(KEY_USER_NAME, name);
  }

  static Future<String> getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(KEY_USER_NAME);
  }

  static void setAddress(String address) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(KEY_USER_ADDRESS, address);
  }

  static Future<String> getAddress() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(KEY_USER_ADDRESS);
  }

  static void setEmail(String email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(KEY_USER_EMAIL, email);
  }

  static Future<String> getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(KEY_USER_EMAIL);
  }

  static void setUser_Picture(String user_picture) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(KEY_USER_PICTURE, user_picture);
  }

  static Future<String> getUser_Picture() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(KEY_USER_PICTURE);
  }

  static void setActive(String active) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(KEY_USER_ACTIVE, active);
  }

  static Future<String> getActive() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(KEY_USER_ACTIVE);
  }

  static void setTesting(int i) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt('Key_testing', i);
  }

  static Future<int> getTesting() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt('Key_testing');
  }

  static void setApisess(String apisess) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(KEY_APISESS, apisess);
  }

  static Future<String> getApisess() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(KEY_USER_ACTIVE);
  }

  static void setTelp(String telp) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(KEY_TELEPHONE, telp);
  }

  static Future<String> getTelp() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(KEY_TELEPHONE);
  }

  static void logout() async{
    setName('');
    setApisess('');
    setId('');
    setEmail('');
  }

}