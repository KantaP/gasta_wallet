
import 'package:injectable/injectable.dart';
import 'package:gastawallet/src/constants/api.dart';
import 'package:gastawallet/src/data/network/dio_client.dart';
import 'package:gastawallet/src/di/components/injection.dart';
import 'package:gastawallet/src/features/shopping_cart/data/repositories/shopping_cart.repo.dart';

@Environment(Env.development)
@Injectable(as: ShoppingCartRepository)
class ShoppingCartRepositoryDev extends ShoppingCartRepository {
  ShoppingCartRepositoryDev()
      : super(
          getIt<DioClient>(),
          ApiConstant.baseUrl,
        );
}