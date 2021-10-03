package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1845:int = 1;
      
      public static const const_1535:int = 2;
       
      
      private var var_929:String;
      
      private var var_2425:int;
      
      private var var_2423:int;
      
      private var var_2427:int;
      
      private var var_2424:int;
      
      private var var_2420:Boolean;
      
      private var var_2323:Boolean;
      
      private var var_2325:int;
      
      private var var_2324:int;
      
      private var var_2426:Boolean;
      
      private var var_2421:int;
      
      private var var_2422:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_929 = param1.readString();
         this.var_2425 = param1.readInteger();
         this.var_2423 = param1.readInteger();
         this.var_2427 = param1.readInteger();
         this.var_2424 = param1.readInteger();
         this.var_2420 = param1.readBoolean();
         this.var_2323 = param1.readBoolean();
         this.var_2325 = param1.readInteger();
         this.var_2324 = param1.readInteger();
         this.var_2426 = param1.readBoolean();
         this.var_2421 = param1.readInteger();
         this.var_2422 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_929;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2425;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2423;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2427;
      }
      
      public function get responseType() : int
      {
         return this.var_2424;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2420;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2323;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2325;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2324;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2426;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2421;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2422;
      }
   }
}
