import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FormType { login, signup }

final formTypeProvider = StateProvider<FormType>((ref) => FormType.login);
