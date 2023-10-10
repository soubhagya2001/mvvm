
import 'package:mvvm/data/response/status.dart';

//generic class
class ApiResponse<T>{
  Status? status;
  T? data; //generic data
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;


  String toString(){
    return "Status : $status \n Message : $message \n Data: $data";
  }
}