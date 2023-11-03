import 'dart:convert';
import 'package:http/http.dart'as http;


class ServiceScreen{
  Future getDataApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    try{

      print(response.statusCode);
      if(response.statusCode ==200){
        print('Response data: ${response.body}');
      }else{
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    }catch(e){
      print('Error: $e');
    }
    return jsonDecode(response.body);
  }
  Future showDetails(int id)async{
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$id'));
    try{

      print(response.statusCode);
      if(response.statusCode ==200){
        print('Response data: ${response.body}');
      }else{
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    }catch(e){
      print('Error: $e');
    }
    return jsonDecode(response.body);
  }
}