package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserChangeMessageParser implements IMessageParser
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _id:int;
      
      private var var_620:String;
      
      private var var_923:String;
      
      private var var_1811:String;
      
      private var var_1992:int;
      
      public function UserChangeMessageParser()
      {
         super();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function get sex() : String
      {
         return this.var_923;
      }
      
      public function get customInfo() : String
      {
         return this.var_1811;
      }
      
      public function get achievementScore() : int
      {
         return this.var_1992;
      }
      
      public function flush() : Boolean
      {
         this._id = 0;
         this.var_620 = "";
         this.var_923 = "";
         this.var_1811 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = param1.readInteger();
         this.var_620 = param1.readString();
         this.var_923 = param1.readString();
         this.var_1811 = param1.readString();
         this.var_1992 = param1.readInteger();
         if(this.var_923)
         {
            this.var_923 = this.var_923.toUpperCase();
         }
         return true;
      }
   }
}
