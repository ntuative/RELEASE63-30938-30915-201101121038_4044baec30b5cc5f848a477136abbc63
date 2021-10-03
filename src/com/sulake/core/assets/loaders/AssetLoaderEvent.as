package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const ASSET_LOADER_EVENT_COMPLETE:String = "AssetLoaderEventComplete";
      
      public static const const_1116:String = "AssetLoaderEventProgress";
      
      public static const const_1081:String = "AssetLoaderEventUnload";
      
      public static const const_982:String = "AssetLoaderEventStatus";
      
      public static const const_41:String = "AssetLoaderEventError";
      
      public static const const_969:String = "AssetLoaderEventOpen";
       
      
      private var _status:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         this._status = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return this._status;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,this._status);
      }
   }
}
