package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_167:Number = 0;
      
      private var var_168:Number = 0;
      
      private var var_1978:Number = 0;
      
      private var var_1977:Number = 0;
      
      private var var_1980:Number = 0;
      
      private var var_1979:Number = 0;
      
      private var var_247:int = 0;
      
      private var var_1976:int = 0;
      
      private var var_296:Array;
      
      private var var_1975:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_296 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_167 = param3;
         this.var_168 = param4;
         this.var_1978 = param5;
         this.var_247 = param6;
         this.var_1976 = param7;
         this.var_1977 = param8;
         this.var_1980 = param9;
         this.var_1979 = param10;
         this.var_1975 = param11;
         this.var_296 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_167;
      }
      
      public function get z() : Number
      {
         return this.var_168;
      }
      
      public function get localZ() : Number
      {
         return this.var_1978;
      }
      
      public function get targetX() : Number
      {
         return this.var_1977;
      }
      
      public function get targetY() : Number
      {
         return this.var_1980;
      }
      
      public function get targetZ() : Number
      {
         return this.var_1979;
      }
      
      public function get dir() : int
      {
         return this.var_247;
      }
      
      public function get dirHead() : int
      {
         return this.var_1976;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_1975;
      }
      
      public function get actions() : Array
      {
         return this.var_296.slice();
      }
   }
}
