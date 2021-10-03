package com.sulake.core.runtime
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.runtime.events.LockEvent;
   import com.sulake.core.runtime.exceptions.ComponentDisposedException;
   import com.sulake.core.runtime.exceptions.InvalidComponentException;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.utils.getQualifiedClassName;
   
   public class Component implements IUnknown
   {
      
      public static const COMPONENT_EVENT_RUNNING:String = "COMPONENT_EVENT_RUNNING";
      
      public static const COMPONENT_EVENT_DISPOSING:String = "COMPONENT_EVENT_DISPOSING";
      
      public static const COMPONENT_EVENT_WARNING:String = "COMPONENT_EVENT_WARNING";
      
      public static const COMPONENT_EVENT_ERROR:String = "COMPONENT_EVENT_ERROR";
      
      public static const COMPONENT_EVENT_DEBUG:String = "COMPONENT_EVENT_DEBUG";
      
      protected static const const_390:String = "_INTERNAL_EVENT_UNLOCKED";
      
      public static const COMPONENT_FLAG_NULL:uint = 0;
      
      public static const const_1784:uint = 1;
      
      public static const COMPONENT_FLAG_CONTEXT:uint = 2;
      
      public static const const_1154:uint = 4;
       
      
      protected var var_727:uint = 0;
      
      protected var var_1191:String = "";
      
      protected var var_1931:String = "";
      
      protected var _lastWarning:String = "";
      
      private var _assets:IAssetLibrary;
      
      private var _events:EventDispatcher;
      
      private var var_1454:uint;
      
      private var var_428:InterfaceStructList;
      
      private var var_15:IContext = null;
      
      private var _disposed:Boolean = false;
      
      private var var_795:Boolean = false;
      
      public function Component(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super();
         this.var_1454 = param2;
         this.var_428 = new InterfaceStructList();
         this._events = new EventDispatcher();
         this.var_15 = param1;
         this._assets = param3 != null ? param3 : new AssetLibrary("_internal_asset_library");
         if(this.var_15 == null)
         {
            throw new InvalidComponentException("IContext not provided to Component\'s constructor!");
         }
      }
      
      public static function getInterfaceStructList(param1:Component) : InterfaceStructList
      {
         return param1.var_428;
      }
      
      public function get locked() : Boolean
      {
         return this.var_795;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get context() : IContext
      {
         return this.var_15;
      }
      
      public function get events() : IEventDispatcher
      {
         return this._events;
      }
      
      public function get assets() : IAssetLibrary
      {
         return this._assets;
      }
      
      public function queueInterface(param1:IID, param2:Function = null) : IUnknown
      {
         var _loc3_:InterfaceStruct = this.var_428.getStructByInterface(param1);
         if(_loc3_ == null)
         {
            return this.var_15.queueInterface(param1,param2);
         }
         if(this._disposed)
         {
            throw new ComponentDisposedException("Failed to queue interface trough disposed Component \"" + getQualifiedClassName(this) + "\"!");
         }
         if(this.var_795)
         {
            return null;
         }
         _loc3_.reserve();
         var _loc4_:IUnknown = _loc3_.unknown as IUnknown;
         if(param2 != null)
         {
            param2(param1,_loc4_);
         }
         return _loc4_;
      }
      
      public function release(param1:IID) : uint
      {
         if(this._disposed)
         {
            return 0;
         }
         var _loc2_:InterfaceStruct = this.var_428.getStructByInterface(param1);
         if(_loc2_ == null)
         {
            this.var_1191 = "Attempting to release unknown interface:" + param1 + "!";
            throw new Error(this.var_1191);
         }
         var _loc3_:uint = _loc2_.release();
         if(this.var_1454 & const_1154)
         {
            if(_loc3_ == 0)
            {
               if(this.var_428.getTotalReferenceCount() == 0)
               {
                  this.var_15.detachComponent(this);
                  this.dispose();
               }
            }
         }
         return _loc3_;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            Logger.log("Disposing component " + getQualifiedClassName(this));
            this._events.dispatchEvent(new Event(Component.COMPONENT_EVENT_DISPOSING));
            this._events = null;
            this.var_428.dispose();
            this.var_428 = null;
            this._assets.dispose();
            this._assets = null;
            this.var_15 = null;
            this.var_727 = 0;
            this._disposed = true;
         }
      }
      
      protected final function lock() : void
      {
         if(!this.var_795)
         {
            this.var_795 = true;
         }
      }
      
      protected final function unlock() : void
      {
         if(this.var_795)
         {
            this.var_795 = false;
            this._events.dispatchEvent(new LockEvent(const_390,this));
         }
      }
      
      public function toString() : String
      {
         return "[component " + getQualifiedClassName(this) + " refs: " + this.var_727 + "]";
      }
      
      public function toXMLString(param1:uint = 0) : String
      {
         var _loc6_:* = null;
         var _loc2_:* = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_ += "\t";
            _loc3_++;
         }
         var _loc4_:String = getQualifiedClassName(this);
         var _loc5_:String = "";
         _loc5_ += _loc2_ + "<component class=\"" + _loc4_ + "\">\n";
         var _loc7_:uint = this.var_428.length;
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc6_ = this.var_428.getStructByIndex(_loc8_);
            _loc5_ += _loc2_ + "\t<interface iid=\"" + _loc6_.iis + "\" refs=\"" + _loc6_.references + "\"/>\n";
            _loc8_++;
         }
         return _loc5_ + (_loc2_ + "</component>\n");
      }
      
      public function registerUpdateReceiver(param1:IUpdateReceiver, param2:uint) : void
      {
         this.var_15.registerUpdateReceiver(param1,param2);
      }
      
      public function removeUpdateReceiver(param1:IUpdateReceiver) : void
      {
         this.var_15.removeUpdateReceiver(param1);
      }
   }
}
