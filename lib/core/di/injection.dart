import 'package:get_it/get_it.dart';
import 'package:vd_login/core/di/core_injection.dart';
import 'package:vd_login/core/di/data_injection.dart';
import 'package:vd_login/core/di/domain_injection.dart';
import 'package:vd_login/core/di/presentation_injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initCore(sl);
  await initData(sl);
  await initDomain(sl);
  await initPresentation(sl);
}