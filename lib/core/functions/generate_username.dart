import 'package:uuid/uuid.dart';

String generateUsername() {
  var uuid = Uuid();
  return 'user_${uuid.v4().substring(0, 8)}';
}
