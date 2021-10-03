package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_244:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2233:int = 0;
      
      private var var_2230:int = 0;
      
      private var var_2234:int = 0;
      
      private var var_2231:Boolean = false;
      
      private var var_2232:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_244,param6,param7);
         this.var_2233 = param1;
         this.var_2230 = param2;
         this.var_2234 = param3;
         this.var_2231 = param4;
         this.var_2232 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2233;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2230;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2234;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2231;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2232;
      }
   }
}
