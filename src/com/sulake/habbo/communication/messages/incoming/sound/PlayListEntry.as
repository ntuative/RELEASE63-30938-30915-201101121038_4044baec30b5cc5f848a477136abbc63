package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1958:int;
      
      private var var_1959:int;
      
      private var var_1957:String;
      
      private var var_1956:String;
      
      private var var_1960:int = 0;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_1958 = param1;
         this.var_1959 = param2;
         this.var_1957 = param3;
         this.var_1956 = param4;
      }
      
      public function get id() : int
      {
         return this.var_1958;
      }
      
      public function get length() : int
      {
         return this.var_1959;
      }
      
      public function get name() : String
      {
         return this.var_1957;
      }
      
      public function get creator() : String
      {
         return this.var_1956;
      }
      
      public function get startPlayHeadPos() : int
      {
         return this.var_1960;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         this.var_1960 = param1;
      }
   }
}
