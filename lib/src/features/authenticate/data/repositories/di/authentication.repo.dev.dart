import 'package:injectable/injectable.dart';
import 'package:gastawallet/src/di/components/injection.dart';
import 'package:gastawallet/src/features/authenticate/data/repositories/authentication.repo.dart';

@Environment(Env.development)
@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryDev extends AuthenticationRepository {
  AuthenticationRepositoryDev(super.userDataSource);
}