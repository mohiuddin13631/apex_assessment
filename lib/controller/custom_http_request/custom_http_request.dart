import 'dart:convert';

import 'package:apex_assessment/model/company_list_model.dart';
import 'package:http/http.dart' as http;

class CustomHttpRequest{

  static Future<CompanyListModel> fetchCompanyList()async{

    CompanyListModel? companyListModel;

    try{
      String url = "http://139.59.35.127/apex-dmit/public/api/company";
      var response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body);
      if(response.statusCode == 200){
        companyListModel = CompanyListModel.fromJson(data);
      }
    }catch(e){
      print(e);
    }

    return companyListModel!;

  }

}