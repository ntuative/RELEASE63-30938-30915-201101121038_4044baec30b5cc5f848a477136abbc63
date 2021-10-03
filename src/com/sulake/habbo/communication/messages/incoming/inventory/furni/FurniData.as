package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2176:int;
      
      private var var_1442:String;
      
      private var _objId:int;
      
      private var var_1739:int;
      
      private var _category:int;
      
      private var var_1939:String;
      
      private var var_2177:Boolean;
      
      private var var_2174:Boolean;
      
      private var var_2173:Boolean;
      
      private var var_2178:Boolean;
      
      private var var_2175:int;
      
      private var var_1342:int;
      
      private var var_1858:String = "";
      
      private var var_1958:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2176 = param1;
         this.var_1442 = param2;
         this._objId = param3;
         this.var_1739 = param4;
         this._category = param5;
         this.var_1939 = param6;
         this.var_2177 = param7;
         this.var_2174 = param8;
         this.var_2173 = param9;
         this.var_2178 = param10;
         this.var_2175 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1858 = param1;
         this.var_1342 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2176;
      }
      
      public function get itemType() : String
      {
         return this.var_1442;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1739;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1939;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2177;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2174;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2173;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2178;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2175;
      }
      
      public function get slotId() : String
      {
         return this.var_1858;
      }
      
      public function get songId() : int
      {
         return this.var_1958;
      }
      
      public function get extra() : int
      {
         return this.var_1342;
      }
   }
}
