package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1486:String;
      
      private var var_2104:int;
      
      private var _password:String;
      
      private var var_1296:int;
      
      private var var_2359:int;
      
      private var var_781:Array;
      
      private var var_2357:Array;
      
      private var var_2289:Boolean;
      
      private var var_2358:Boolean;
      
      private var var_2353:Boolean;
      
      private var var_2356:Boolean;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2289;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2289 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2358;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2358 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2353;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2353 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2356;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2356 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1486;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1486 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2104;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2104 = param1;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1296;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1296 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2359;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2359 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_781;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_781 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2357;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2357 = param1;
      }
   }
}
