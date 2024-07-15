import 'package:barbers_app/repositories/barber_repository.dart';
import 'package:barbers_app/services/barber_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Services
  getIt.registerLazySingleton<BarberService>(
      () => BarberServiceImpl("barberzone"));

  // Repositories
  getIt.registerLazySingleton<BarberRepository>(
      () => BarberRepositoryImpl(getIt()));
}
