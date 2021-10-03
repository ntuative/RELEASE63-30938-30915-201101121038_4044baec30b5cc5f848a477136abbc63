package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_642:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_924:String = "RWOCM_CLUB_MAIN";
       
      
      private var var_2067:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_642);
         this.var_2067 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2067;
      }
   }
}
