package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2188:String;
      
      private var var_2185:int;
      
      private var var_2184:int;
      
      private var var_2186:String;
      
      private var var_2187:int;
      
      private var var_1574:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2188 = param1.readString();
         this.var_2185 = param1.readInteger();
         this.var_2184 = param1.readInteger();
         this.var_2186 = param1.readString();
         this.var_2187 = param1.readInteger();
         this.var_1574 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2188;
      }
      
      public function get unitPort() : int
      {
         return this.var_2185;
      }
      
      public function get worldId() : int
      {
         return this.var_2184;
      }
      
      public function get castLibs() : String
      {
         return this.var_2186;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2187;
      }
      
      public function get nodeId() : int
      {
         return this.var_1574;
      }
   }
}
