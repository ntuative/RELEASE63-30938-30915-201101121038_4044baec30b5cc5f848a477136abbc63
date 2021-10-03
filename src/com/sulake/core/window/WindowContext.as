package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_533:uint = 0;
      
      public static const const_1542:uint = 1;
      
      public static const const_1739:int = 0;
      
      public static const const_1792:int = 1;
      
      public static const const_1757:int = 2;
      
      public static const const_1732:int = 3;
      
      public static const const_1514:int = 4;
      
      public static const const_381:int = 5;
      
      public static var var_1451:IMouseCursor;
      
      public static var var_356:IEventQueue;
      
      private static var var_617:IEventProcessor;
      
      private static var var_1844:uint = const_533;
      
      private static var stage:Stage;
      
      private static var var_152:IWindowRenderer;
       
      
      private var _eventProcessorState:EventProcessorState;
      
      private var var_2617:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_176:DisplayObjectContainer;
      
      protected var var_2745:Boolean = true;
      
      protected var var_1191:Error;
      
      protected var var_1953:int = -1;
      
      protected var var_1206:IInternalWindowServices;
      
      protected var var_1457:IWindowParser;
      
      protected var var_2698:IWindowFactory;
      
      protected var var_133:IDesktopWindow;
      
      protected var var_1458:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_519:Boolean = false;
      
      private var var_2616:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_152 = param2;
         this._localization = param4;
         this.var_176 = param5;
         this.var_1206 = new ServiceManager(this,param5);
         this.var_2698 = param3;
         this.var_1457 = new WindowParser(this);
         this.var_2617 = param7;
         if(!stage)
         {
            if(this.var_176 is Stage)
            {
               stage = this.var_176 as Stage;
            }
            else if(this.var_176.stage)
            {
               stage = this.var_176.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_133 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_176.addChild(this.var_133.getDisplayObject());
         this.var_176.doubleClickEnabled = true;
         this.var_176.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this._eventProcessorState = new EventProcessorState(var_152,this.var_133,this.var_133,null,this.var_2617);
         inputMode = const_533;
         this.var_1458 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1844;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_356)
         {
            if(var_356 is IDisposable)
            {
               IDisposable(var_356).dispose();
            }
         }
         if(var_617)
         {
            if(var_617 is IDisposable)
            {
               IDisposable(var_617).dispose();
            }
         }
         switch(value)
         {
            case const_533:
               var_356 = new MouseEventQueue(stage);
               var_617 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1542:
               var_356 = new TabletEventQueue(stage);
               var_617 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_533;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_176.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_176.removeChild(IGraphicContextHost(this.var_133).getGraphicContext(true) as DisplayObject);
            this.var_133.destroy();
            this.var_133 = null;
            this.var_1458.destroy();
            this.var_1458 = null;
            if(this.var_1206 is IDisposable)
            {
               IDisposable(this.var_1206).dispose();
            }
            this.var_1206 = null;
            this.var_1457.dispose();
            this.var_1457 = null;
            var_152 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1191;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_1953;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1191 = param2;
         this.var_1953 = param1;
         if(this.var_2745)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1191 = null;
         this.var_1953 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1206;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1457;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2698;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_133;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1451 == null)
         {
            var_1451 = new MouseCursorControl(this.var_176);
         }
         return var_1451;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_133.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:Class = Classes.getWindowClassByType(param3);
         if(_loc12_ == null)
         {
            this.handleError(WindowContext.const_1514,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1458;
            }
         }
         var _loc13_:IWindow = new _loc12_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_133,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc13_.caption = param2;
         }
         return _loc13_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_133)
         {
            this.var_133 = null;
         }
         if(param1.state != WindowState.const_406)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_152.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_519 = true;
         if(this.var_1191)
         {
            throw this.var_1191;
         }
         var_617.process(this._eventProcessorState,var_356);
         this.var_519 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2616 = true;
         var_152.update(param1);
         this.var_2616 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_133 != null && !this.var_133.disposed)
         {
            if(this.var_176 is Stage)
            {
               this.var_133.width = Stage(this.var_176).stageWidth;
               this.var_133.height = Stage(this.var_176).stageHeight;
            }
            else
            {
               this.var_133.width = this.var_176.width;
               this.var_133.height = this.var_176.height;
            }
         }
      }
   }
}
