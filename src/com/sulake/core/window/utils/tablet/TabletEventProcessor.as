package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2763:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var_133 = param1.desktop;
         var_77 = param1.var_1190 as WindowController;
         _lastClickTarget = param1.var_1188 as WindowController;
         var_152 = param1.renderer;
         var_779 = param1.var_1189;
         param2.begin();
         param2.end();
         param1.desktop = var_133;
         param1.var_1190 = var_77;
         param1.var_1188 = _lastClickTarget;
         param1.renderer = var_152;
         param1.var_1189 = var_779;
      }
   }
}
