package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1446:String = "WN_CRETAE";
      
      public static const const_1352:String = "WN_CREATED";
      
      public static const const_967:String = "WN_DESTROY";
      
      public static const const_1024:String = "WN_DESTROYED";
      
      public static const const_1090:String = "WN_OPEN";
      
      public static const const_1064:String = "WN_OPENED";
      
      public static const const_965:String = "WN_CLOSE";
      
      public static const const_984:String = "WN_CLOSED";
      
      public static const const_1143:String = "WN_FOCUS";
      
      public static const const_1138:String = "WN_FOCUSED";
      
      public static const const_1139:String = "WN_UNFOCUS";
      
      public static const const_940:String = "WN_UNFOCUSED";
      
      public static const const_955:String = "WN_ACTIVATE";
      
      public static const const_337:String = "WN_ACTVATED";
      
      public static const const_1107:String = "WN_DEACTIVATE";
      
      public static const const_1053:String = "WN_DEACTIVATED";
      
      public static const const_462:String = "WN_SELECT";
      
      public static const const_334:String = "WN_SELECTED";
      
      public static const const_838:String = "WN_UNSELECT";
      
      public static const const_592:String = "WN_UNSELECTED";
      
      public static const const_954:String = "WN_LOCK";
      
      public static const const_1158:String = "WN_LOCKED";
      
      public static const const_1112:String = "WN_UNLOCK";
      
      public static const const_997:String = "WN_UNLOCKED";
      
      public static const const_993:String = "WN_ENABLE";
      
      public static const const_792:String = "WN_ENABLED";
      
      public static const const_1036:String = "WN_DISABLE";
      
      public static const const_682:String = "WN_DISABLED";
      
      public static const const_690:String = "WN_RESIZE";
      
      public static const const_173:String = "WN_RESIZED";
      
      public static const const_949:String = "WN_RELOCATE";
      
      public static const const_514:String = "WN_RELOCATED";
      
      public static const const_1083:String = "WN_MINIMIZE";
      
      public static const const_1142:String = "WN_MINIMIZED";
      
      public static const const_1057:String = "WN_MAXIMIZE";
      
      public static const const_968:String = "WN_MAXIMIZED";
      
      public static const const_1133:String = "WN_RESTORE";
      
      public static const const_1077:String = "WN_RESTORED";
      
      public static const const_1756:String = "WN_ARRANGE";
      
      public static const const_1753:String = "WN_ARRANGED";
      
      public static const const_1830:String = "WN_UPDATE";
      
      public static const const_1832:String = "WN_UPDATED";
      
      public static const const_357:String = "WN_CHILD_ADDED";
      
      public static const const_626:String = "WN_CHILD_REMOVED";
      
      public static const const_305:String = "WN_CHILD_RESIZED";
      
      public static const const_266:String = "WN_CHILD_RELOCATED";
      
      public static const const_235:String = "WN_CHILD_ACTIVATED";
      
      public static const const_402:String = "WN_PARENT_ADDED";
      
      public static const const_936:String = "WN_PARENT_REMOVED";
      
      public static const const_419:String = "WN_PARENT_RESIZED";
      
      public static const const_926:String = "WN_PARENT_RELOCATED";
      
      public static const const_852:String = "WN_PARENT_ACTIVATED";
      
      public static const const_509:String = "WN_STATE_UPDATED";
      
      public static const const_431:String = "WN_STYLE_UPDATED";
      
      public static const const_434:String = "WN_PARAM_UPDATED";
      
      public static const const_1712:String = "";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1947,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
