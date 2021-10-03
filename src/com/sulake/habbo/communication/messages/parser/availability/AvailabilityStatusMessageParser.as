package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1383:Boolean;
      
      private var var_1791:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function get isOpen() : Boolean
      {
         return this.var_1383;
      }
      
      public function get onShutDown() : Boolean
      {
         return this.var_1791;
      }
      
      public function flush() : Boolean
      {
         this.var_1383 = false;
         this.var_1791 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1383 = param1.readInteger() > 0;
         this.var_1791 = param1.readInteger() > 0;
         return true;
      }
   }
}
