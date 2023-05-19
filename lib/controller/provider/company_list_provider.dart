import 'package:apex_assessment/controller/custom_http_request/custom_http_request.dart';
import 'package:apex_assessment/model/company_list_model.dart';
import 'package:flutter/foundation.dart';


//todo: if we want to manage state then we can do this way but in normal task state management not needed
class CompanyListProvider with ChangeNotifier {

  CompanyListModel? companyListModel;

  getCompanyList() async {
    companyListModel = await CustomHttpRequest.fetchCompanyList();
    notifyListeners();
  }

}