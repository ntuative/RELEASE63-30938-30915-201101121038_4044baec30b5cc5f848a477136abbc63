package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_363:String = "RWRQUE_VISITOR_QUEUE_STATUS";
      
      public static const const_539:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
       
      
      private var var_1089:int;
      
      private var var_2658:Boolean;
      
      private var var_370:Boolean;
      
      private var var_1876:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1089 = param2;
         this.var_2658 = param3;
         this.var_370 = param4;
         this.var_1876 = param5;
      }
      
      public function get position() : int
      {
         return this.var_1089;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return this.var_2658;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_370;
      }
      
      public function get isClubQueue() : Boolean
      {
         return this.var_1876;
      }
   }
}
