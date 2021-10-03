package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_620:String;
      
      private var var_923:String;
      
      private var var_2452:String;
      
      private var var_1699:String;
      
      private var var_2451:int;
      
      private var var_2449:String;
      
      private var var_2450:int;
      
      private var var_2453:int;
      
      private var var_2142:int;
      
      private var _respectLeft:int;
      
      private var var_670:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_620 = param1.readString();
         this.var_923 = param1.readString();
         this.var_2452 = param1.readString();
         this.var_1699 = param1.readString();
         this.var_2451 = param1.readInteger();
         this.var_2449 = param1.readString();
         this.var_2450 = param1.readInteger();
         this.var_2453 = param1.readInteger();
         this.var_2142 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_670 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function get sex() : String
      {
         return this.var_923;
      }
      
      public function get customData() : String
      {
         return this.var_2452;
      }
      
      public function get realName() : String
      {
         return this.var_1699;
      }
      
      public function get tickets() : int
      {
         return this.var_2451;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2449;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2450;
      }
      
      public function get directMail() : int
      {
         return this.var_2453;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2142;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_670;
      }
   }
}
