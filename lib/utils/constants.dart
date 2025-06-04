import 'package:uuid/uuid.dart';

class Constants{
  //-----------------api call end-----------------
  String baseUrl='';
  String version='';
  String clientKey='';
  String uuid ='';

  String deviceInfo='api/v1/device-activity';
  String login='api/v2/auth/mobile/login';
  String signup='api/v1/user/customer/sign-up';
  String generateOtp='api/v1/user/phone/generate-otp';
  String verifyOtp='api/v1/user/phone/verify-otp';
  String chargePoint='api/v3/charge-point';
  String userProfile='api/v1/user/profile';
  String chargeDetailPoint='api/v1/charge-point/';
  String chargePointList='api/v1/charge-point/list';
  String editUserProfile='api/v1/user/profile/image';
  String companyList='api/v1/vehicle-company/list';
  String companyModelList='api/v1/vehicle-company/';
  String modelEndPoint='/models';
  
  //-------login
  String token='accessToken';
  String firstname='firstName';
  String lastName='lastName';
  String clientKeyValue='clientKey';
  String userKey='userKey';
}
