package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_608:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1144:String = "inventory_effects";
      
      public static const const_1054:String = "inventory_badges";
      
      public static const const_1305:String = "inventory_clothes";
      
      public static const const_1527:String = "inventory_furniture";
       
      
      private var var_2364:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_608);
         this.var_2364 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2364;
      }
   }
}
