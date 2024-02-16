import 'package:collection/collection.dart';

enum WifiType {
  has('あり'),
  hasNot('なし'),
  unknown('未確認'),
  ;

  const WifiType(this.label);
  final String label;

  static WifiType fromLabel(String label) {
    return values.firstWhereOrNull((e) => e.label == label) ?? unknown;
  }
}


// if(type == WifiType.has) {
//   // wifiアイコン出す
// }
