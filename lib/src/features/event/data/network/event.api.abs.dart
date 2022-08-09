import 'package:gastawallet/src/features/event/model/event.m.dart';

abstract class IEventApiClient {
  Future<List<EventModel>> getEvents();
  Future<EventModel> postEvent(EventModel item);
}