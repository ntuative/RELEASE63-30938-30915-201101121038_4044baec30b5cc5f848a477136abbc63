package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_824:int = 1;
      
      public static const const_741:int = 2;
      
      public static const const_739:int = 3;
      
      public static const const_1072:int = 4;
      
      public static const const_669:int = 5;
      
      public static const const_1118:int = 6;
       
      
      private var _type:int;
      
      private var var_1175:int;
      
      private var var_2502:String;
      
      private var var_2625:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1175 = param2;
         this.var_2502 = param3;
         this.var_2625 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2502;
      }
      
      public function get time() : String
      {
         return this.var_2625;
      }
      
      public function get senderId() : int
      {
         return this.var_1175;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
