import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/features/module_based/models/module_model.dart';

final modulesListProvider = StateProvider<List<ModuleModel>>((ref) => []);

final levelContentProvider = StateProvider<List<Widget>>((ref) => []);

final currentSubtaskNumber = StateProvider((ref) => 0);

final continueProvider = StateProvider((ref) => false);
