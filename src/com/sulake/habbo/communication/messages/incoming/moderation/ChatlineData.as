package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2065:int;
      
      private var var_2064:int;
      
      private var var_2066:int;
      
      private var var_2063:String;
      
      private var var_1589:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2065 = param1.readInteger();
         this.var_2064 = param1.readInteger();
         this.var_2066 = param1.readInteger();
         this.var_2063 = param1.readString();
         this.var_1589 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2065;
      }
      
      public function get minute() : int
      {
         return this.var_2064;
      }
      
      public function get chatterId() : int
      {
         return this.var_2066;
      }
      
      public function get chatterName() : String
      {
         return this.var_2063;
      }
      
      public function get msg() : String
      {
         return this.var_1589;
      }
   }
}
