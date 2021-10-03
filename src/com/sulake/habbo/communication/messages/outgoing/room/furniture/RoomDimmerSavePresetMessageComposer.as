package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2343:int;
      
      private var var_2342:int;
      
      private var var_2344:String;
      
      private var var_2341:int;
      
      private var var_2340:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2343 = param1;
         this.var_2342 = param2;
         this.var_2344 = param3;
         this.var_2341 = param4;
         this.var_2340 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2343,this.var_2342,this.var_2344,this.var_2341,int(this.var_2340)];
      }
      
      public function dispose() : void
      {
      }
   }
}
