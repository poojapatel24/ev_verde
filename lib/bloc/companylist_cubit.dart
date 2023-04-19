import 'package:ev_verde/bloc/states/companylist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/ev_verde_repo.dart';

class CompanyListCubit extends Cubit<CompanyListState>{
  EvVerdeRepo evVerdeRepo;
  CompanyListCubit(this.evVerdeRepo):super(CompanyListInitial()){
    getCompanyNameList();
  }

  void getCompanyNameList() async{
    try{
      emit(CompanyListLoading());
      final responseCompanyList=await EvVerdeRepo().getCompanyList();
      emit(CompanyListLoaded(responseCompanyList));
    }catch(e){
      emit(CompanyListError('$e'));
    }
  }

  Future<void> getCompanyModelList({required int vid}) async{
    try{
     // emit(CompanyModelListLoading());
      final responseCompanyModelList=await EvVerdeRepo().getCompanyModelList(vid: vid);
      emit(CompanyModelListLoaded(responseCompanyModelList));
    }catch(e){
      emit(CompanyListError('$e'));
    }
  }
}
