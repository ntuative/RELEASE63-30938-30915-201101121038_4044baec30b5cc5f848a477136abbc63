package com.sulake.habbo.session.events
{
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class BadgeImageReadyEvent extends Event
   {
      
      public static const const_135:String = "BIRE_BADGE_IMAGE_READY";
       
      
      private var var_289:String;
      
      private var var_42:BitmapData;
      
      public function BadgeImageReadyEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_135,param3,param4);
         this.var_289 = param1;
         this.var_42 = param2;
      }
      
      public function get badgeId() : String
      {
         return this.var_289;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_42;
      }
   }
}
