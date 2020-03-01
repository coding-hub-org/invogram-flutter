import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AuthenticateState extends ChangeNotifier {
  static AuthenticateState of(BuildContext context, {bool listen: true}) {
    return Provider.of<AuthenticateState>(context, listen: listen);
  }
}
