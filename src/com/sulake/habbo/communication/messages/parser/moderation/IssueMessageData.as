package com.sulake.habbo.communication.messages.parser.moderation
{
   public class IssueMessageData
   {
      
      public static const const_147:int = 1;
      
      public static const const_343:int = 2;
      
      public static const const_1465:int = 3;
       
      
      private var var_2078:int;
      
      private var _state:int;
      
      private var var_1296:int;
      
      private var _reportedCategoryId:int;
      
      private var var_1492:int;
      
      private var var_2306:int;
      
      private var var_2303:int = 0;
      
      private var var_2308:int;
      
      private var var_2304:String;
      
      private var var_1427:int;
      
      private var var_1859:String;
      
      private var var_2310:int;
      
      private var var_2305:String;
      
      private var _message:String;
      
      private var var_2307:int;
      
      private var var_864:String;
      
      private var var_1595:int;
      
      private var var_2309:String;
      
      private var var_330:int;
      
      private var var_2311:String;
      
      private var var_2144:String;
      
      private var var_2185:int;
      
      private var var_2184:int;
      
      public function IssueMessageData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:String, param9:int, param10:String, param11:int, param12:String, param13:String, param14:int, param15:String, param16:int, param17:String, param18:int, param19:String, param20:String, param21:int, param22:int)
      {
         super();
         this.var_2078 = param1;
         this._state = param2;
         this.var_1296 = param3;
         this._reportedCategoryId = param4;
         this.var_1492 = param5;
         this.var_2306 = param6;
         this.var_2308 = param7;
         this.var_2304 = param8;
         this.var_1427 = param9;
         this.var_1859 = param10;
         this.var_2310 = param11;
         this.var_2305 = param12;
         this._message = param13;
         this.var_2307 = param14;
         this.var_864 = param15;
         this.var_1595 = param16;
         this.var_2309 = param17;
         this.var_330 = param18;
         this.var_2311 = param19;
         this.var_2144 = param20;
         this.var_2185 = param21;
         this.var_2184 = param22;
      }
      
      public function get issueId() : int
      {
         return this.var_2078;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get categoryId() : int
      {
         return this.var_1296;
      }
      
      public function get reportedCategoryId() : int
      {
         return this._reportedCategoryId;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1492;
      }
      
      public function get priority() : int
      {
         return this.var_2306 + this.var_2303;
      }
      
      public function get reporterUserId() : int
      {
         return this.var_2308;
      }
      
      public function get reporterUserName() : String
      {
         return this.var_2304;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1427;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_1859;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_2310;
      }
      
      public function get pickerUserName() : String
      {
         return this.var_2305;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2307;
      }
      
      public function get roomName() : String
      {
         return this.var_864;
      }
      
      public function get roomType() : int
      {
         return this.var_1595;
      }
      
      public function get flatType() : String
      {
         return this.var_2309;
      }
      
      public function get flatId() : int
      {
         return this.var_330;
      }
      
      public function get flatOwnerName() : String
      {
         return this.var_2311;
      }
      
      public function get roomResources() : String
      {
         return this.var_2144;
      }
      
      public function get unitPort() : int
      {
         return this.var_2185;
      }
      
      public function get worldId() : int
      {
         return this.var_2184;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         this.var_2303 = param1;
      }
      
      public function getOpenTime(param1:int) : String
      {
         var _loc2_:int = (param1 - this.var_1492) / 1000;
         var _loc3_:int = _loc2_ % 60;
         var _loc4_:int = _loc2_ / 60;
         var _loc5_:int = _loc4_ % 60;
         var _loc6_:int = _loc4_ / 60;
         var _loc7_:String = _loc3_ < 10 ? "0" + _loc3_ : "" + _loc3_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         var _loc9_:String = _loc6_ < 10 ? "0" + _loc6_ : "" + _loc6_;
         return _loc9_ + ":" + _loc8_ + ":" + _loc7_;
      }
   }
}
