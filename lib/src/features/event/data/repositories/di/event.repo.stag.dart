

import 'package:injectable/injectable.dart';
import 'package:gastawallet/src/constants/api.dart';
import 'package:gastawallet/src/data/network/dio_client.dart';
import 'package:gastawallet/src/di/components/injection.dart';
import 'package:gastawallet/src/features/event/data/repositories/event.repo.dart';

@Environment(Env.stagging)
@Injectable(as: EventRepository)
class EventRepositoryStag extends EventRepository {
  EventRepositoryStag()
      : super(
          getIt<DioClient>(),
          ApiConstant.baseUrl,
        );
}