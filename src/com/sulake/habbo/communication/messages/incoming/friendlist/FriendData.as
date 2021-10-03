package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_938:int;
      
      private var var_718:Boolean;
      
      private var var_1633:Boolean;
      
      private var var_620:String;
      
      private var var_1296:int;
      
      private var var_1845:String;
      
      private var var_1701:String;
      
      private var var_1699:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_938 = param1.readInteger();
         this.var_718 = param1.readBoolean();
         this.var_1633 = param1.readBoolean();
         this.var_620 = param1.readString();
         this.var_1296 = param1.readInteger();
         this.var_1845 = param1.readString();
         this.var_1701 = param1.readString();
         this.var_1699 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_938;
      }
      
      public function get online() : Boolean
      {
         return this.var_718;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1633;
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function get categoryId() : int
      {
         return this.var_1296;
      }
      
      public function get motto() : String
      {
         return this.var_1845;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1701;
      }
      
      public function get realName() : String
      {
         return this.var_1699;
      }
   }
}
