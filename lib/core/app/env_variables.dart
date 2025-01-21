import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvType { dev, prod,  }

class EnvVariables {
  EnvVariables._();
  static final EnvVariables instance = EnvVariables._();
  String envType = "";
  Future<void> init({required EnvType type}) async {
    switch (type) {
      case EnvType.dev:
        await dotenv.load(fileName: ".env.dev");
      case EnvType.prod:
        await dotenv.load(fileName: ".env.prod");
    }
    envType = dotenv.get('ENV_TYPE');
  }

  String getEnvType() => envType;
  bool get debugMode => envType == "dev";
}
