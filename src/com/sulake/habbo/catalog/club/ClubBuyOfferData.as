package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1867:String;
      
      private var var_1787:int;
      
      private var var_2602:Boolean;
      
      private var var_2600:Boolean;
      
      private var var_2605:int;
      
      private var var_2599:int;
      
      private var var_363:ICatalogPage;
      
      private var var_2603:int;
      
      private var var_2601:int;
      
      private var var_2604:int;
      
      private var var_2676:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1867 = param2;
         this.var_1787 = param3;
         this.var_2602 = param4;
         this.var_2600 = param5;
         this.var_2605 = param6;
         this.var_2599 = param7;
         this.var_2603 = param8;
         this.var_2601 = param9;
         this.var_2604 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1867;
      }
      
      public function get price() : int
      {
         return this.var_1787;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2602;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2600;
      }
      
      public function get periods() : int
      {
         return this.var_2605;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2599;
      }
      
      public function get year() : int
      {
         return this.var_2603;
      }
      
      public function get month() : int
      {
         return this.var_2601;
      }
      
      public function get day() : int
      {
         return this.var_2604;
      }
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_416;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1787;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_363;
      }
      
      public function get priceType() : String
      {
         return Offer.const_680;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1867;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_363 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2676;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2676 = param1;
      }
   }
}
