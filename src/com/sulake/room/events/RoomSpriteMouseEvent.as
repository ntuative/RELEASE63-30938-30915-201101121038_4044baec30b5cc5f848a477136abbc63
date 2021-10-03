package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1680:String = "";
      
      private var var_1752:String = "";
      
      private var var_2348:String = "";
      
      private var var_2632:Number = 0;
      
      private var var_2634:Number = 0;
      
      private var var_2633:Number = 0;
      
      private var var_2631:Number = 0;
      
      private var var_1963:Boolean = false;
      
      private var var_1962:Boolean = false;
      
      private var var_1961:Boolean = false;
      
      private var var_1964:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1680 = param2;
         this.var_1752 = param3;
         this.var_2348 = param4;
         this.var_2632 = param5;
         this.var_2634 = param6;
         this.var_2633 = param7;
         this.var_2631 = param8;
         this.var_1963 = param9;
         this.var_1962 = param10;
         this.var_1961 = param11;
         this.var_1964 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1680;
      }
      
      public function get canvasId() : String
      {
         return this.var_1752;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2348;
      }
      
      public function get method_14() : Number
      {
         return this.var_2632;
      }
      
      public function get screenY() : Number
      {
         return this.var_2634;
      }
      
      public function get localX() : Number
      {
         return this.var_2633;
      }
      
      public function get localY() : Number
      {
         return this.var_2631;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_1963;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_1962;
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
