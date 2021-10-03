package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CanCreateRoomMessageParser implements IMessageParser
   {
      
      public static const const_1769:int = 0;
      
      public static const const_1667:int = 1;
       
      
      private var var_1682:int;
      
      private var var_2052:int;
      
      public function CanCreateRoomMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1682 = param1.readInteger();
         this.var_2052 = param1.readInteger();
         return true;
      }
      
      public function get resultCode() : int
      {
         return this.var_1682;
      }
      
      public function get roomLimit() : int
      {
         return this.var_2052;
      }
   }
}
