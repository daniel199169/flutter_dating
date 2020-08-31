import 'package:shared_preferences/shared_preferences.dart';
import 'package:nubae/models/User.dart';
import 'date_utils.dart';

enum Login_Status { NEW_USER, LOGGED_IN, LOGGED_OUT }

const String DateFormat = 'yyyy-MM-dd';

class SessionManager {
  static final String KEY_LOGGEDIN = 'logged_in';
  static final String KEY_EMAIL = 'key_email';
  static final String KEY_IMAGE = 'key_image';
  static final String KEY_USER_ID = 'key_user_id';

  static SharedPreferences _sharedPrefs;

  static void initialize(SharedPreferences sharedPreferences) {
    _sharedPrefs = sharedPreferences;
  }

  static Login_Status isLogged() {
    var loggedIn = _sharedPrefs.getString(KEY_LOGGEDIN) ?? false;

    if (loggedIn == 'true') {
      return Login_Status.LOGGED_IN;
    } else {
      return Login_Status.LOGGED_OUT;
    }
  }

  static void saveUserInfoToLocal(User userInfo) {
    SessionManager.setUserId(userInfo.uid);
  }

  static bool isLoggin() {
    if (getUserId().isNotEmpty) return true;
    return false;
  }

  static String getUserId() {
    return _sharedPrefs.getString(KEY_USER_ID) ?? '';
  }

  static void setUserId(String userId) {
    _sharedPrefs.setString(KEY_USER_ID, userId);
  }

  static void hasLoggedIn() {
    _sharedPrefs.setString(KEY_LOGGEDIN, 'true');
  }

  static void hasLoggedOut() {
    _sharedPrefs.setString(KEY_LOGGEDIN, 'false');
    handleClearAllSettging();
  }

  static void handleClearAllSettging() {
    setUserId(null);

    setEmail('');
    setImage('');
  }

  static String getEmail() {
    return _sharedPrefs.getString(KEY_EMAIL) ?? '';
  }

  static void setEmail(String email) {
    _sharedPrefs.setString(KEY_EMAIL, email);
  }

  static String getImage() {
    return _sharedPrefs.getString(KEY_IMAGE) ?? '';
  }

  static void setImage(String image) {
    _sharedPrefs.setString(KEY_IMAGE, image);
  }
}
