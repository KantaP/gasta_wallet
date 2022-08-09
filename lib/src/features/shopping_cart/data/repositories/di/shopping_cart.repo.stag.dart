import 'package:injectable/injectable.dart';
import 'package:gastawallet/src/constants/api.dart';
import 'package:gastawallet/src/data/network/dio_client.dart';
import 'package:gastawallet/src/di/components/injection.dart';
import 'package:gastawallet/src/features/shopping_cart/data/repositories/shopping_cart.repo.dart';

@Environment(Env.stagging)
@Injectable(as: ShoppingCartRepository)
class ShoppingCartRepositoryStag extends ShoppingCartRepository {
  ShoppingCartRepositoryStag()
      : super(
          getIt<DioClient>(),
          ApiConstant.baseUrl,
        );
}