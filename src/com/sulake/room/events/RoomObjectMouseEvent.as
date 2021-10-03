package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_254:String = "ROE_MOUSE_CLICK";
      
      public static const const_1844:String = "ROE_MOUSE_ENTER";
      
      public static const const_456:String = "ROE_MOUSE_MOVE";
      
      public static const const_1652:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1731:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_461:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1680:String = "";
      
      private var var_1962:Boolean;
      
      private var var_1963:Boolean;
      
      private var var_1961:Boolean;
      
      private var var_1964:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1680 = param2;
         this.var_1962 = param5;
         this.var_1963 = param6;
         this.var_1961 = param7;
         this.var_1964 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1680;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_1962;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_1963;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_1961;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_1964;
      }
   }
}
