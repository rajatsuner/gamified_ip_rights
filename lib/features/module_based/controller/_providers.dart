import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/features/module_based/models/module_model.dart';

final modulesProvider = StateProvider<List<ModuleModel>>((ref) => []);
