import 'package:equatable/equatable.dart';
import 'package:ev_verde/model/companyname/responsecompanymodel.dart';
import 'package:ev_verde/model/companyname/responsecompanynamelist.dart';

class CompanyModelListState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class CompanyModelListInitial extends CompanyModelListState{}

class CompanyModelListLoading extends CompanyModelListState{}

class CompanyModelLoaded extends CompanyModelListState{
  ResponseCompanyModel companyModel;
  CompanyModelLoaded(this.companyModel);
}

class CompanyModelListError extends CompanyModelListState{
  String error;
  CompanyModelListError(this.error);
}