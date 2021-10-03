package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1566:int;
      
      private var var_1565:int;
      
      private var var_1564:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1565 = param1.readInteger();
         this.var_1566 = param1.readInteger();
         this.var_1564 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1566 = 0;
         this.var_1565 = 0;
         this.var_1564 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1566;
      }
      
      public function get messageId() : int
      {
         return this.var_1565;
      }
      
      public function get timestamp() : String
      {
         return this.var_1564;
      }
   }
}
