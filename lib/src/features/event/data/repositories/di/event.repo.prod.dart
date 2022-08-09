

import 'package:injectable/injectable.dart';
import 'package:gastawallet/src/constants/api.dart';
import 'package:gastawallet/src/data/network/dio_client.dart';
import 'package:gastawallet/src/di/components/injection.dart';
import 'package:gastawallet/src/features/event/data/repositories/event.repo.dart';

@Environment(Env.production)
@Injectable(as: EventRepository)
class EventRepositoryProd extends EventRepository {
  EventRepositoryProd()
      : super(
          getIt<DioClient>(),
          ApiConstant.baseUrl,
        );
}