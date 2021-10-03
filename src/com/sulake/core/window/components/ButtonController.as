package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.events.WindowTouchEvent;
   import com.sulake.core.window.utils.tablet.ITouchAwareWindow;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class ButtonController extends InteractiveController implements IButtonWindow, ITouchAwareWindow
   {
      
      protected static const TEXT_FIELD_NAME:String = "_BTN_TEXT";
       
      
      public function ButtonController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         param4 |= 0;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         expandToAccommodateChildren();
      }
      
      override public function set caption(param1:String) : void
      {
         super.caption = param1;
         var _loc2_:IWindow = getChildByName(TEXT_FIELD_NAME);
         if(_loc2_ != null)
         {
            _loc2_.caption = caption;
         }
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         var type:String = null;
         var subject:WindowController = param1;
         var event:Event = param2;
         if(event is WindowNotifyEvent)
         {
            switch(event.type)
            {
               case WindowNotifyEvent.const_305:
                  width = 0;
                  break;
               case WindowNotifyEvent.const_792:
                  try
                  {
                     getChildByName(TEXT_FIELD_NAME).blend = getChildByName(TEXT_FIELD_NAME).blend + 0.5;
                  }
                  catch(e:Error)
                  {
                  }
                  break;
               case WindowNotifyEvent.const_682:
                  try
                  {
                     getChildByName(TEXT_FIELD_NAME).blend = getChildByName(TEXT_FIELD_NAME).blend - 0.5;
                  }
                  catch(e:Error)
                  {
                  }
            }
         }
         else if(event is WindowTouchEvent)
         {
            type = "null";
            switch(event.type)
            {
               case WindowTouchEvent.const_647:
                  type = "null";
                  break;
               case WindowTouchEvent.const_939:
                  type = "null";
                  break;
               case WindowTouchEvent.const_551:
                  type = "null";
            }
            event = new WindowMouseEvent(type,WindowTouchEvent(event).window,WindowTouchEvent(event).related,WindowTouchEvent(event).localX,WindowTouchEvent(event).localY,WindowTouchEvent(event).stageX,WindowTouchEvent(event).stageY,WindowTouchEvent(event).altKey,WindowTouchEvent(event).ctrlKey,WindowTouchEvent(event).shiftKey,true,0);
         }
         return super.update(subject,event);
      }
   }
}
