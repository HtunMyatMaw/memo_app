import 'package:choose_app/redux/device_uuid_action.dart';

String deviceUUIDReducer(String uuid, action) {
  if (action is SetDeviceUUIDAction) {
    return action.deviceUUID;
  }
  return uuid;
}
