package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1426:Boolean;
      
      private var var_2122:int;
      
      private var var_1724:int;
      
      private var var_1725:int;
      
      private var var_2121:int;
      
      private var var_2120:int;
      
      private var var_2119:int;
      
      private var var_2000:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1426;
      }
      
      public function get commission() : int
      {
         return this.var_2122;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1724;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1725;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2120;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2121;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2119;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2000;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1426 = param1.readBoolean();
         this.var_2122 = param1.readInteger();
         this.var_1724 = param1.readInteger();
         this.var_1725 = param1.readInteger();
         this.var_2120 = param1.readInteger();
         this.var_2121 = param1.readInteger();
         this.var_2119 = param1.readInteger();
         this.var_2000 = param1.readInteger();
         return true;
      }
   }
}
