import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../env/env.dart';

/// API key provider
final apiKeyProvider = Provider.autoDispose<String>((ref) => Env.apiKey);