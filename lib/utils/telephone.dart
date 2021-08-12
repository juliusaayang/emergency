import 'package:permission_handler/permission_handler.dart';
import 'package:telephony/telephony.dart';

class Telephone {
  final Telephony telephony = Telephony.instance;

  final String phoneNumber, message;

  Telephone(this.phoneNumber, this.message);

  sendMessage() async {
    var status = await Permission.sms.status;
    // check permission status
    if (status.isDenied) {
      print('permission denied');
    }
    if (status.isGranted) {
      print('permission granted');
    }

    print(phoneNumber);

    // check if a device is capable of sending SMS
    bool canSendSms = await telephony.isSmsCapable;
    print(canSendSms);

    // get sim state
    SimState simState = await telephony.simState;
    print(simState);

    telephony.sendSms(
      to: phoneNumber,
      message: message,
    );
  }
}
