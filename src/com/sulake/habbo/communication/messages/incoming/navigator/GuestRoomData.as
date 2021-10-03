package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_330:int;
      
      private var var_690:Boolean;
      
      private var var_864:String;
      
      private var _ownerName:String;
      
      private var var_2104:int;
      
      private var var_2051:int;
      
      private var var_2290:int;
      
      private var var_1486:String;
      
      private var var_2292:int;
      
      private var var_2102:Boolean;
      
      private var var_691:int;
      
      private var var_1296:int;
      
      private var var_2293:String;
      
      private var var_781:Array;
      
      private var var_2291:RoomThumbnailData;
      
      private var var_2289:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_781 = new Array();
         super();
         this.var_330 = param1.readInteger();
         this.var_690 = param1.readBoolean();
         this.var_864 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2104 = param1.readInteger();
         this.var_2051 = param1.readInteger();
         this.var_2290 = param1.readInteger();
         this.var_1486 = param1.readString();
         this.var_2292 = param1.readInteger();
         this.var_2102 = param1.readBoolean();
         this.var_691 = param1.readInteger();
         this.var_1296 = param1.readInteger();
         this.var_2293 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_781.push(_loc4_);
            _loc3_++;
         }
         this.var_2291 = new RoomThumbnailData(param1);
         this.var_2289 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_781 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_330;
      }
      
      public function get event() : Boolean
      {
         return this.var_690;
      }
      
      public function get roomName() : String
      {
         return this.var_864;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2104;
      }
      
      public function get userCount() : int
      {
         return this.var_2051;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2290;
      }
      
      public function get description() : String
      {
         return this.var_1486;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2292;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2102;
      }
      
      public function get score() : int
      {
         return this.var_691;
      }
      
      public function get categoryId() : int
      {
         return this.var_1296;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2293;
      }
      
      public function get tags() : Array
      {
         return this.var_781;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2291;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2289;
      }
   }
}
