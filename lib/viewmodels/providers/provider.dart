import 'package:flutter/material.dart';
import 'package:flutter_application_imtihon/model/product_model.dart';
import 'package:flutter_application_imtihon/viewmodels/repositories/repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderEd  extends ChangeNotifier{

  final RepositoriesEd repositoriesEd;

  bool isLoading=false;

  ProviderEd({required this.repositoriesEd});

  final String? token="";



  List<ProductModel> products=[];

   Future<bool> authLogIn(String phoneNumber, String password) async{

      isLoading=true;
      notifyListeners();
      final javob= await repositoriesEd.logIn(phoneNumber, password);

      if(javob=="yaxshi")
      {
        return true;
      }

      return false;

   }

   Future<bool> authSignUp(List<String> dataOfSignUp) async
   {

     isLoading=false;
     notifyListeners();

     final javob = await repositoriesEd.signUp(dataOfSignUp[0], dataOfSignUp[1], dataOfSignUp[2], dataOfSignUp[3]);

     if(javob!=null)
     {
      
      return true;
     }

     return false;
   }



   Future<void> getFurnitures() async{
    isLoading=true;
    notifyListeners();
   final prefs= await SharedPreferences.getInstance();
   final token=prefs.getString("token");

   final productdata= await repositoriesEd.getProduct(token!);

   products.add(productdata);
   isLoading=false;
   notifyListeners();


   }




}
