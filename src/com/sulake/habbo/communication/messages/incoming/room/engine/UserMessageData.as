package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_971:String = "M";
      
      public static const const_1378:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_167:Number = 0;
      
      private var var_168:Number = 0;
      
      private var var_247:int = 0;
      
      private var _name:String = "";
      
      private var var_2123:int = 0;
      
      private var var_923:String = "";
      
      private var var_620:String = "";
      
      private var var_1993:String = "";
      
      private var var_1992:int;
      
      private var var_1995:int = 0;
      
      private var var_1997:String = "";
      
      private var var_1996:int = 0;
      
      private var var_1994:int = 0;
      
      private var var_2124:String = "";
      
      private var var_161:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_161 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_161)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_167;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_161)
         {
            this.var_167 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_168;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_161)
         {
            this.var_168 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_247;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_161)
         {
            this.var_247 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_161)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_2123;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_161)
         {
            this.var_2123 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_923;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_161)
         {
            this.var_923 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_161)
         {
            this.var_620 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_1993;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_161)
         {
            this.var_1993 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_1992;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_161)
         {
            this.var_1992 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_1995;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_161)
         {
            this.var_1995 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_1997;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_161)
         {
            this.var_1997 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_1996;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_161)
         {
            this.var_1996 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_1994;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_161)
         {
            this.var_1994 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2124;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_161)
         {
            this.var_2124 = param1;
         }
      }
   }
}
