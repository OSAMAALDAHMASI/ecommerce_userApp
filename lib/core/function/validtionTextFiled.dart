

import 'package:get/get.dart';

validInput(String val,int min,int max,String type){

   if(type=="address"){
     if(val.isEmpty){
       return " Can't be Empty";
     }
  }
else{
if(val.isEmpty){
return " Can't be Empty";
}
else if(type=="userName"){
if(!GetUtils.isUsername(val)){
return "Not Valid userName";
}}
else if(type=="email"){
if(!GetUtils.isEmail(val)){
return "Not Valid Email";
}}
else if(type=="phone"){
if(!GetUtils.isPhoneNumber(val)){
return "Not Valid Phone";
}}
else if(type=="password"){
if(!GetUtils.isUsername(val)){
return "Not Valid password";
}}


else if(val.length < min){
return "Value Can't be less than $min";
}

else if(val.length > min){
return "Value Can't be Larger than $max";
}
}
}