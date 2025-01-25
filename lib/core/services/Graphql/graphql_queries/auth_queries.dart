
import 'package:shopzen/features/auth/data/models/login_request_body.dart';

class AuthQueries {
  const AuthQueries._();
  static const instance = AuthQueries._();
  factory AuthQueries() {
    return instance;
  }

  Map<String, dynamic> loginQuery(
          {required LoginRequestBodyModel loginRequestBodyModel}) =>
      {
        "query": r'''
                  mutation login($email: String!, $password: String!) {
	login(email: $email, password: $password) {
		access_token
		refresh_token
	}
}


''',
        "variables": {
          'email': loginRequestBodyModel.email,
          'password': loginRequestBodyModel.password
        }
      };
}
