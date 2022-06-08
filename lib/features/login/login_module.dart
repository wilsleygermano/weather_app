import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/login/data/data_sources/login_user_data_source.dart';
import 'package:weather_app/features/login/domain/login_user_with_email_and_password_use_case.dart';
import 'package:weather_app/features/login/presentation/controller/login_controller.dart';
import 'package:weather_app/features/login/presentation/view/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<LoginUserDataSource>((i) => FirebaseLoginUserDataSource()),
        Bind<LoginUserWithEmailAndPasswordUseCase>(
          (i) => DefaultLoginUseCase(),
        ),
        Bind<LoginController>(
          (i) => LoginController(),
        )
      ];

  @override
  List<ModularRoute> get routes =>
      [
        ChildRoute(Modular.initialRoute, child: (context, args) =>  LoginPage()),
        
        ];

}
