import 'package:apex_assessment/controller/custom_http_request/custom_http_request.dart';
import 'package:apex_assessment/model/company_list_model.dart';
import 'package:apex_assessment/utils/custom_color.dart';
import 'package:apex_assessment/utils/custom_font.dart';
import 'package:flutter/material.dart';

import '../components/custom_floating_button.dart';
class CompanyListScreen extends StatefulWidget {
  const CompanyListScreen({Key? key}) : super(key: key);

  @override
  State<CompanyListScreen> createState() => _CompanyListScreenState();
}

class _CompanyListScreenState extends State<CompanyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          centerTitle: true,
          title: Text("Company List",style: myStyle(18,titleTextColor,FontWeight.w600),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<CompanyListModel>(
            future: CustomHttpRequest.fetchCompanyList(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return const Center(child: CircularProgressIndicator());
              }
              else{
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.companyList!.data!.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.companyList!.data![index];
                      return Container(
                        height: 116,
                        decoration: BoxDecoration(
                          border:Border(top: BorderSide(color:Colors.grey.withOpacity(.5),width: 1))
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(top: 22,bottom: 30,left: 27),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.companyName.toString(),style: myStyle(17,titleTextColor,FontWeight.w600),),
                              const SizedBox(height: 1,),
                              Text(data.email.toString(),style: myStyle(14,normalTextColor,FontWeight.w400),),
                              const SizedBox(height: 1,),
                              Text(data.phone.toString(),style: myStyle(14,normalTextColor,FontWeight.w400),)
                            ],
                          ),
                        ),
                      );
                  },),
                );
              }
          },)
        ],
      ),

      floatingActionButton: const SizedBox(
        width: 145,
        height: 45,
        child: CustomFloatingButton(),
      ),

    );
  }
}


