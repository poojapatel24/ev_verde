import 'package:equatable/equatable.dart';
import 'package:ev_verde/model/companyname/responsecompanymodel.dart';
import 'package:ev_verde/model/companyname/responsecompanynamelist.dart';

class CompanyListState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class CompanyListInitial extends CompanyListState{}

class CompanyListLoading extends CompanyListState{}

class CompanyListLoaded extends CompanyListState{
  ResponseCompanyNameList companyNameList;
  CompanyListLoaded(this.companyNameList);
}

class CompanyModelListLoaded extends CompanyListState{
  ResponseCompanyModel companyModel;
  CompanyModelListLoaded(this.companyModel);
}

class CompanyListError extends CompanyListState{
  String error;
  CompanyListError(this.error);
}