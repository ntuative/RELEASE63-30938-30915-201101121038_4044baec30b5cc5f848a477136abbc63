package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2096:int;
      
      private var var_2100:int;
      
      private var var_2097:int;
      
      private var _dayOffsets:Array;
      
      private var var_1792:Array;
      
      private var var_1793:Array;
      
      private var var_2099:int;
      
      private var var_2098:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2096;
      }
      
      public function get offerCount() : int
      {
         return this.var_2100;
      }
      
      public function get historyLength() : int
      {
         return this.var_2097;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1792;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1793;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2099;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2098;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2096 = param1.readInteger();
         this.var_2100 = param1.readInteger();
         this.var_2097 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1792 = [];
         this.var_1793 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1792.push(param1.readInteger());
            this.var_1793.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2098 = param1.readInteger();
         this.var_2099 = param1.readInteger();
         return true;
      }
   }
}
