package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1165:Boolean;
      
      private var var_1166:Boolean;
      
      private var var_1423:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1165;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1166;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1423;
      }
      
      public function flush() : Boolean
      {
         this.var_1165 = false;
         this.var_1166 = false;
         this.var_1423 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1165 = param1.readBoolean();
         this.var_1166 = param1.readBoolean();
         this.var_1423 = param1.readBoolean();
         return true;
      }
   }
}
