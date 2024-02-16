import 'package:envied/envied.dart';

part 'env.g.dart';

// ignore: avoid_classes_with_only_static_members
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'KEY', obfuscate: true)
  static String key = _Env.key;
}
