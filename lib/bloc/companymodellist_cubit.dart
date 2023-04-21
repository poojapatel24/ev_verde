
import 'package:ev_verde/bloc/states/companymodellist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/ev_verde_repo.dart';

class CompanyModelListCubit extends Cubit<CompanyModelListState> {
  EvVerdeRepo evVerdeRepo;
  int vid;
  CompanyModelListCubit(this.evVerdeRepo,this.vid) :super(CompanyModelListInitial());
 /* {
    getCompanyModelList(vid: vid);
  }*/

  Future<void> getCompanyModelList({required int vid}) async{
    try{
      emit(CompanyModelListLoading());
      final responseCompanyModelList=await EvVerdeRepo().getCompanyModelList(vid: vid);
      emit(CompanyModelLoaded(responseCompanyModelList));
    }catch(e){
      emit(CompanyModelListError('$e'));
    }
  }
}
