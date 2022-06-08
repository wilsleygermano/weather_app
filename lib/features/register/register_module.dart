import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/register/data/data_sources/register_user_data_source.dart';
import 'package:weather_app/features/register/domain/use_cases/register_with_mail_and_password_use_case.dart';
import 'package:weather_app/features/register/presentation/controller/register_controller.dart';
import 'package:weather_app/features/register/presentation/view/register_page.dart';

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<RegisterUserDataSource>((i) => FirebaseRegisterUserDataSource()),
        Bind<RegisterWithMailAndPasswordUseCase>(
            (i) => DefaultRegisterUseCase()),
        Bind<RegisterController>((i) => RegisterController()),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute(Modular.initialRoute, child: (context, args) => const RegisterPage())];
}
