package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1965:String;
      
      private var var_2211:Array;
      
      private var var_2210:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_1965 = param1;
         this.var_2211 = param2;
         this.var_2210 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_1965;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2211;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2210;
      }
   }
}
