import 'package:injectable/injectable.dart';
import 'package:gastawallet/src/constants/api.dart';
import 'package:gastawallet/src/data/network/dio_client.dart';
import 'package:gastawallet/src/di/components/injection.dart';
import 'package:gastawallet/src/features/shopping_cart/data/repositories/shopping_cart.repo.dart';

@Environment(Env.production)
@Injectable(as: ShoppingCartRepository)
class ShoppingCartRepositoryProd extends ShoppingCartRepository {
  ShoppingCartRepositoryProd()
      : super(
          getIt<DioClient>(),
          ApiConstant.baseUrl,
        );
}