import 'package:apartment_admin/core/SERVER/root_link_api.dart';


class AuthLinkAPI {
  static String baseUrl = "$rootLink/auth";
  static String signIn = "$baseUrl/sign_in/sign_in.php";
  static String sendCode = "$baseUrl/sign_up/send_code.php";
  static String signUp = "$baseUrl/sign_up/sign_up.php";
  static String verifiyCode = "$baseUrl/sign_up/verifiy_code.php";
  static String restPassword = "$baseUrl/rest_password/rest_password.php";
  static String fPrestPassword = "$baseUrl/forget_password/rest_password.php";
  static String fPsendCode = "$baseUrl/forget_password/send_code.php";
  static String fPverifyCode = "$baseUrl/forget_password/verifiy_code.php";
  static String deleteProfile = "$baseUrl/update/delete_user_photo.php";
  static String setProfile = "$baseUrl/update/set_user_photo.php";
  static String updateUser = "$baseUrl/update/updata_user_info.php";
  static String getUser = "$baseUrl/get_user.php";
}
