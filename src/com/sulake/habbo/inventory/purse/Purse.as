package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1678:int = 0;
      
      private var var_1677:int = 0;
      
      private var var_2566:int = 0;
      
      private var var_2565:Boolean = false;
      
      private var var_2323:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1678 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1677 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2566 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2565 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2323 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1678;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1677;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2566;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2565;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2323;
      }
   }
}
