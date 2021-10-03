package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1681:Boolean;
      
      private var var_2345:int;
      
      private var var_392:Boolean;
      
      private var var_1084:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1681;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2345;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1084;
      }
      
      public function get owner() : Boolean
      {
         return this.var_392;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1084 != null)
         {
            this.var_1084.dispose();
            this.var_1084 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1681 = param1.readBoolean();
         if(this.var_1681)
         {
            this.var_2345 = param1.readInteger();
            this.var_392 = param1.readBoolean();
         }
         else
         {
            this.var_1084 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
