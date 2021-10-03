package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1285:String = "WE_CREATE";
      
      public static const const_1467:String = "WE_CREATED";
      
      public static const const_1295:String = "WE_DESTROY";
      
      public static const const_261:String = "WE_DESTROYED";
      
      public static const const_1402:String = "WE_OPEN";
      
      public static const const_1536:String = "WE_OPENED";
      
      public static const const_1470:String = "WE_CLOSE";
      
      public static const const_1406:String = "WE_CLOSED";
      
      public static const const_1561:String = "WE_FOCUS";
      
      public static const const_189:String = "WE_FOCUSED";
      
      public static const const_1540:String = "WE_UNFOCUS";
      
      public static const const_1571:String = "WE_UNFOCUSED";
      
      public static const const_1526:String = "WE_ACTIVATE";
      
      public static const const_1319:String = "WE_ACTIVATED";
      
      public static const const_1473:String = "WE_DEACTIVATE";
      
      public static const const_674:String = "WE_DEACTIVATED";
      
      public static const const_432:String = "WE_SELECT";
      
      public static const const_54:String = "WE_SELECTED";
      
      public static const const_694:String = "WE_UNSELECT";
      
      public static const const_841:String = "WE_UNSELECTED";
      
      public static const const_1730:String = "WE_ATTACH";
      
      public static const const_1679:String = "WE_ATTACHED";
      
      public static const const_1648:String = "WE_DETACH";
      
      public static const const_1654:String = "WE_DETACHED";
      
      public static const const_1400:String = "WE_LOCK";
      
      public static const const_1398:String = "WE_LOCKED";
      
      public static const const_1460:String = "WE_UNLOCK";
      
      public static const const_1545:String = "WE_UNLOCKED";
      
      public static const const_786:String = "WE_ENABLE";
      
      public static const const_277:String = "WE_ENABLED";
      
      public static const const_744:String = "WE_DISABLE";
      
      public static const const_231:String = "WE_DISABLED";
      
      public static const const_1371:String = "WE_RELOCATE";
      
      public static const const_338:String = "WE_RELOCATED";
      
      public static const const_1310:String = "WE_RESIZE";
      
      public static const const_45:String = "WE_RESIZED";
      
      public static const const_1407:String = "WE_MINIMIZE";
      
      public static const const_1480:String = "WE_MINIMIZED";
      
      public static const const_1387:String = "WE_MAXIMIZE";
      
      public static const const_1472:String = "WE_MAXIMIZED";
      
      public static const const_1548:String = "WE_RESTORE";
      
      public static const const_1454:String = "WE_RESTORED";
      
      public static const const_1853:String = "WE_ARRANGE";
      
      public static const const_1723:String = "WE_ARRANGED";
      
      public static const const_99:String = "WE_UPDATE";
      
      public static const const_1752:String = "WE_UPDATED";
      
      public static const const_1859:String = "WE_CHILD_RELOCATE";
      
      public static const const_503:String = "WE_CHILD_RELOCATED";
      
      public static const const_1659:String = "WE_CHILD_RESIZE";
      
      public static const const_286:String = "WE_CHILD_RESIZED";
      
      public static const const_1783:String = "WE_CHILD_REMOVE";
      
      public static const const_528:String = "WE_CHILD_REMOVED";
      
      public static const const_1640:String = "WE_PARENT_RELOCATE";
      
      public static const const_1658:String = "WE_PARENT_RELOCATED";
      
      public static const const_1635:String = "WE_PARENT_RESIZE";
      
      public static const const_1408:String = "WE_PARENT_RESIZED";
      
      public static const const_174:String = "WE_OK";
      
      public static const const_657:String = "WE_CANCEL";
      
      public static const const_106:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_489:String = "WE_SCROLL";
      
      public static const const_145:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_1947:IWindow;
      
      protected var var_1948:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_1947 = param3;
         this.var_1948 = false;
         super(param1,param4,param5);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_1947;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_1948 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1948;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
