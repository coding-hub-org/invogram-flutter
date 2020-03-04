import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ReminderState extends ChangeNotifier {
  static ReminderState of(BuildContext context, {bool listen: true}) {
    return Provider.of<ReminderState>(context, listen: listen);
  }
}
