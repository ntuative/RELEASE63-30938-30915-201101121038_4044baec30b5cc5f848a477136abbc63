package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2096:int;
      
      private var var_2100:int;
      
      private var var_2097:int;
      
      private var _dayOffsets:Array;
      
      private var var_1792:Array;
      
      private var var_1793:Array;
      
      private var var_2099:int;
      
      private var var_2098:int;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2096 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2100 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2097 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1792 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1793 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2099 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2098 = param1;
      }
   }
}
