import 'package:dio/dio.dart';
import 'package:ev_verde/model/chargepoint/request_chargepointlist.dart';
import 'package:ev_verde/model/chargepoint/response_chargedetailpoint.dart';
import 'package:ev_verde/model/chargepoint/response_chargepointlist.dart';
import 'package:ev_verde/model/deviceactivity/request_device.dart';
import 'package:ev_verde/model/login/request_login.dart';
import 'package:ev_verde/model/otp/request_generate_otp.dart';
import 'package:ev_verde/model/otp/request_verify_otp.dart';
import 'package:ev_verde/model/signup/request_signup.dart';
import 'package:ev_verde/restapi/network_api_service.dart';
import 'package:ev_verde/utils/constants.dart';

import '../model/chargepoint/response_chargepoint.dart';
import '../model/companyname/responsecompanymodel.dart';
import '../model/companyname/responsecompanynamelist.dart';
import '../model/deviceactivity/response_device.dart';
import '../model/login/response_login.dart';
import '../model/otp/response_generate_otp.dart';
import '../model/otp/resposne_verify_otp.dart';
import '../model/signup/response_signup.dart';
import '../model/user/response_userprofile.dart';
import '../restapi/dioexception.dart';
import '../restapi/logger_interceptor.dart';

class EvVerdeRepo{
  static final EvVerdeRepo _evVerdeRepo=EvVerdeRepo();
  static EvVerdeRepo get evVerdeRepo => _evVerdeRepo;

  //---------device activity--------------
  Future<ResponseDevice> deviceActivity({required RequestDevice requestDevice}) async{
      try{
        ResponseDevice responseDevice;
        Response response=await NetworkApiService().callPostApiResponse(url: Constants().deviceInfo, body: requestDevice.toJson());
        responseDevice=ResponseDevice.fromJson(response.data);
        return responseDevice;
      }catch(e){
        LoggerInterceptor().logger.d('get device $e');
        throw Exception(e);
      }
  }

  //-------------------login api call------------------------
  Future<ResponseLogin> login({required RequestLogin requestLogin}) async{
    try{
      ResponseLogin responseLogin;
      Response response=await NetworkApiService().callPostApiResponse(url: Constants().login, body: requestLogin.toJson());
      responseLogin=ResponseLogin.fromJson(response.data);
      return responseLogin;
    } catch (e){
      LoggerInterceptor().logger.d('get login $e');
      throw Exception(e);
    }
  }

  //----------------------sign up api call---------------------------
  Future<ResponseSignup> signUp({required RequestSignup requestSignup}) async{
    try{
      ResponseSignup responseSignup;
      Response response=await NetworkApiService().callPostApiResponse(url: Constants().signup, body: requestSignup.toJson());
      responseSignup=ResponseSignup.fromJson(response.data);
      return responseSignup;
    }catch(e){
      LoggerInterceptor().logger.d('get sign up $e');
      throw Exception(e);
    }
  }

  //---------------------generate otp api call--------------------------
  Future<ResponseGenerateOtp> generateOtp({required RequestGenerateOtp requestGenerateOtp}) async{
    try{
      ResponseGenerateOtp responseGenerateOtp;
      Response response=await NetworkApiService().callPostApiResponse(url: Constants().generateOtp, body: requestGenerateOtp.toJson());
      responseGenerateOtp=ResponseGenerateOtp.fromJson(response.data);
      return responseGenerateOtp;
    }catch(e){
      LoggerInterceptor().logger.d('generate otp error $e');
      throw Exception(e);
    }
  }

  //--------------------------verify otp api call------------------
  Future<ResponseVerifyOtp> verifyOtp({required RequestVerifyOtp requestVerifyOtp}) async{
    try{
      ResponseVerifyOtp responseVerifyOtp;
      Response response=await NetworkApiService().callPostApiResponse(url: Constants().verifyOtp, body: requestVerifyOtp.toJson());
      responseVerifyOtp=ResponseVerifyOtp.fromJson(response.data);
      return responseVerifyOtp;
    }catch(e){
      LoggerInterceptor().logger.d('verify otp error $e');
      throw Exception(e);
    }
  }

  //------------------------------charge point-------------------------------
  Future<ResponseChargePoint> chargePoint() async{
    try{
      ResponseChargePoint responseChargePoint;
      Response response=await NetworkApiService().callGetApiResponse(url: Constants().chargePoint);
      responseChargePoint=ResponseChargePoint.fromJson(response.data);
      return responseChargePoint;
    }catch(e){
      LoggerInterceptor().logger.d('charge point $e');
      throw Exception(e);
    }
  }

  //------------------------------charge detail point-------------------------------
  Future<ResponseChargeDetailPoint> chargeDetailPoint({required int id}) async{
    try{
      ResponseChargeDetailPoint responseChargeDetailPoint;
      Response response=await NetworkApiService().callGetApiResponse(url: Constants().chargeDetailPoint + id.toString() );
      responseChargeDetailPoint=ResponseChargeDetailPoint.fromJson(response.data);
      return responseChargeDetailPoint;
    }catch(e){
      LoggerInterceptor().logger.d('charge point $e');
      throw Exception(e);
    }
  }

  //--------------------------------charge point list ---------------------------------
  Future<ResponseChargePointList> chargePointList({required RequestChargePointList requestChargePointList}) async {
    try{
      ResponseChargePointList responseChargePointList;
      Response response=await NetworkApiService().callPostApiResponse(url: Constants().chargePointList, body: requestChargePointList.toJson());
      responseChargePointList=ResponseChargePointList.fromJson(response.data);
      return responseChargePointList;
    }catch(e){
      LoggerInterceptor().logger.d('charge point list $e');
      throw Exception(e);
    }
  }
  //------------------------------User Profile-------------------------------------
  Future<ResponseUserProfile> getUserProfile() async{
    try{
      ResponseUserProfile responseUserProfile;
      Response response=await NetworkApiService().callGetApiResponse(url: Constants().userProfile);
      responseUserProfile=ResponseUserProfile.fromJson(response.data);
      return responseUserProfile;
    }catch(e){
      LoggerInterceptor().logger.d('user profile $e');
      throw Exception(e);
    }
  }

  //------------------------------get company list--------------------------------------
  Future<ResponseCompanyNameList> getCompanyList() async{
    try{
      ResponseCompanyNameList companyNameList;
      Response response=await NetworkApiService().callGetApiResponse(url: Constants().companyList);
      companyNameList=ResponseCompanyNameList.fromJson(response.data);
      return companyNameList;
    }catch(e){
      LoggerInterceptor().logger.d('company list $e');
      throw Exception(e);
    }
  }

  //-------------------------------get company model list-------------------------------------
  Future<ResponseCompanyModel> getCompanyModelList({required int vid}) async{
    try{
      ResponseCompanyModel companyModel;
      Response response=await NetworkApiService().callGetApiResponse(url: Constants().companyModelList+vid.toString()+Constants().modelEndPoint );
      companyModel=ResponseCompanyModel.fromJson(response.data);
      return companyModel;
    }catch(e){
      LoggerInterceptor().logger.d('company model list $e');
      throw Exception(e);
    }
  }

}