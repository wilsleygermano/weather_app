import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/register/register_module.dart';

class AppModule extends Module {
  // @override
  // List<Bind> get binds => [
  //       Bind<RegisterUserDataSource>((i) => FirebaseRegisterUserDataSource()),
  //       Bind<RegisterWithMailAndPasswordUseCase>(
  //           (i) => DefaultRegisterUseCase()),
  //       Bind<RegisterController>((i) => RegisterController()),
  //     ];

   @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: RegisterModule(),
        ),
        // ModuleRoute(
        //   '/register/',
        //   module: RegisterModule(),
        // ),
        // ModuleRoute(
        //   '/onboarding/',
        //   module: OnboardingModule(),
        // ),
      ];

}
