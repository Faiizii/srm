import 'package:shared_preferences/shared_preferences.dart';
import 'package:srm/model/DailyWagesUsers.dart';
class MyPreferences{

  static SharedPreferences preferences ;
  static void saveUser(Model model) async{
    if(preferences == null)
      preferences =  await SharedPreferences.getInstance();
    if(model != null){
      preferences.setString("id", model.id);
      preferences.setString("name", model.name);
    }
  }

  static void getUserId() async{
    if(preferences == null)
      preferences = await  SharedPreferences.getInstance();
    print("getUserId");
    print(preferences.getString("id")?? "No Found");
  }
}
