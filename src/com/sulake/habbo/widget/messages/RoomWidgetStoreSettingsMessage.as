package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage
   {
      
      public static const const_1334:String = "RWSSM_STORE_SETTINGS";
      
      public static const const_840:String = "RWSSM_STORE_SOUND";
      
      public static const const_767:String = "RWSSM_PREVIEW_SOUND";
       
      
      private var var_464:Number;
      
      public function RoomWidgetStoreSettingsMessage(param1:String)
      {
         super(param1);
      }
      
      public function get volume() : Number
      {
         return this.var_464;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_464 = param1;
      }
   }
}
