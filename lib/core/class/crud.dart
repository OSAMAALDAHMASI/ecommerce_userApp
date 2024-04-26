import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/function/checkInternet.dart';
import 'package:http/http.dart' as http;

import 'statusRequest.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl,Map data) async {
  try{
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkUrl), body: data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        print("------------from postdata $responseBody");
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }catch(e){
    print(e);
    return const Left(StatusRequest.serverException);



  }
  }

  }

