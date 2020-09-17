class Api
{
  //base url
  static final BASE_URL = "http://viion.net/octopus/android/api";
  
  //Apis to Communicate
  static final  API_LOGIN = "$BASE_URL/login_employee";
  static final  API_GET_STOCK = "$BASE_URL/get_stock_in_hand";
  static final API_ADD_PRODUCTION = "$BASE_URL/add_production_data";
  static final API_ADD_CONSUME = "$BASE_URL/add_consume_data";
  static final API_ADD_WASTE = "$BASE_URL/add_waste_data";
  static final API_ADD_RECEIVE = "$BASE_URL/add_received_data";
  static final API_PRODUCTION_SUMMARY = "$BASE_URL/get_production_summary";
  static final API_GET_JOB_TYPES= "$BASE_URL/get_job_types";
  static final API_ADD_DAILY_WAGES_USER = "$BASE_URL/add_daily_wages_user_data";
  static final API_GET_DAILY_WAGES_USERS = "$BASE_URL/get_daily_wages_users";
  static final API_ADD_DAILY_WAGES = "$BASE_URL/add_daily_wages";
  static final API_GET_MONTHLY_PRODUCTION_REPORT = "$BASE_URL/get_monthly_production_summary";


  //parameters
  static final PARAM_USERNAME = "username";
  static final PARAM_PASSWORD = "password";

  static final  USER_ID = "user_id";
  static final  USER_GUIDE = "userGuide";
  static final  LOCATION = "location";
  static final  IP_ADDRESS= "ip_address";
  static final  PTA = "pta";
  static final  CELLOPHANE = "cellophane";
  static final  INNER_BOX = "innerBox";
  static final  OUTER_BOX = "outerBox";
  static final  INK_RIBBON = "inkRibbon";
  static final  MAKEUP = "makeup";
  static final  SOLVENT = "solvent";
  static final  TEAR_TAPE = "tape";
  static final  LABEL = "label";
  static final  INK_CATRIAGE = "inkCartriage";
  static final  USERNAME = "username";
  static final  PASSWORD = "password";
  static final  SIM_PRINTING = "sim_printing";
  static final  WRAPPING = "wrapping";
  static final  QUALITY = "quality";
  static final  PACKING = "packing";
  static final  TRANSPORT = "transport";
  static final  DATE = "date";
  static final  JOB_TYPE = "job_type";
  static final  NAME = "name";
  static final  CNIC = "cnic";
  static final  PHONE = "phone";

   static final  INSERTION_VALUE = "insertion_value";
   static final  INSERTION_USER_ID = "insertion_user_id";
   static final  QUALITY_VALUE = "quality_value";
   static final  QUALITY_USER_ID = "quality_user_id";
   static final  PACKING_VALUE = "packing_value";
   static final  PACKING_USER_ID = "packing_user_id";
}