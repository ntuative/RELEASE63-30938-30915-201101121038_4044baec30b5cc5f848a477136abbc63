package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1867:String;
      
      private var var_1787:int;
      
      private var var_2602:Boolean;
      
      private var var_2600:Boolean;
      
      private var var_2605:int;
      
      private var var_2599:int;
      
      private var var_2603:int;
      
      private var var_2601:int;
      
      private var var_2604:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1867 = param1.readString();
         this.var_1787 = param1.readInteger();
         this.var_2602 = param1.readBoolean();
         this.var_2600 = param1.readBoolean();
         this.var_2605 = param1.readInteger();
         this.var_2599 = param1.readInteger();
         this.var_2603 = param1.readInteger();
         this.var_2601 = param1.readInteger();
         this.var_2604 = param1.readInteger();
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
   }
}
