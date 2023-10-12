import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tithe_tracker/core/viewmodels/tithe_vm.dart';

final titheProvider = ChangeNotifierProvider<TitheVM>(
  (ref) => TitheVM(),
);
