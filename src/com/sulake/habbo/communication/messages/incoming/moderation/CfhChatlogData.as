package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1857:int;
      
      private var var_2638:int;
      
      private var var_1427:int;
      
      private var var_2307:int;
      
      private var var_108:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1857 = param1.readInteger();
         this.var_2638 = param1.readInteger();
         this.var_1427 = param1.readInteger();
         this.var_2307 = param1.readInteger();
         this.var_108 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1857);
      }
      
      public function get callId() : int
      {
         return this.var_1857;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2638;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1427;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2307;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_108;
      }
   }
}
