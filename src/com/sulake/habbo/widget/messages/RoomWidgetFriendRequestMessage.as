package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFriendRequestMessage extends RoomWidgetMessage
   {
      
      public static const const_832:String = "RWFRM_ACCEPT";
      
      public static const const_644:String = "RWFRM_DECLINE";
       
      
      private var var_1062:int = 0;
      
      public function RoomWidgetFriendRequestMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this.var_1062 = param2;
      }
      
      public function get requestId() : int
      {
         return this.var_1062;
      }
   }
}
