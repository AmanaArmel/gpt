import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
class ApiServices{
  static Future<void> sendMessage(String prompt) async {
    try{
      var response = await http.post(
        Uri.parse("https://api.openai.com/v1/chat/completions"),
        headers: {
          "Authorization": "Bearer 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",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [{
            "role": "user",
            "content": prompt
          }],
          //do"max_tokens": 100
        })
      );
      Map jsonResponse=jsonDecode(response.body);
      if(jsonResponse["error"]!=null){
        throw HttpException(jsonResponse['error']['message']);
      }
      print("reponse $jsonResponse");
    } catch(error){
      rethrow;
    }
  }
}