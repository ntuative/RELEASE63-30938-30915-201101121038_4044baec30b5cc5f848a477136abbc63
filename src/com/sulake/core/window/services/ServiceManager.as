package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2721:uint;
      
      private var var_130:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var _windowContext:IWindowContext;
      
      private var var_1103:IMouseDraggingService;
      
      private var var_1101:IMouseScalingService;
      
      private var var_1098:IMouseListenerService;
      
      private var var_1100:IFocusManagerService;
      
      private var var_1099:IToolTipAgentService;
      
      private var var_1102:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2721 = 0;
         this.var_130 = param2;
         this._windowContext = param1;
         this.var_1103 = new WindowMouseDragger(param2);
         this.var_1101 = new WindowMouseScaler(param2);
         this.var_1098 = new WindowMouseListener(param2);
         this.var_1100 = new FocusManager(param2);
         this.var_1099 = new WindowToolTipAgent(param2);
         this.var_1102 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1103 != null)
         {
            this.var_1103.dispose();
            this.var_1103 = null;
         }
         if(this.var_1101 != null)
         {
            this.var_1101.dispose();
            this.var_1101 = null;
         }
         if(this.var_1098 != null)
         {
            this.var_1098.dispose();
            this.var_1098 = null;
         }
         if(this.var_1100 != null)
         {
            this.var_1100.dispose();
            this.var_1100 = null;
         }
         if(this.var_1099 != null)
         {
            this.var_1099.dispose();
            this.var_1099 = null;
         }
         if(this.var_1102 != null)
         {
            this.var_1102.dispose();
            this.var_1102 = null;
         }
         this.var_130 = null;
         this._windowContext = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1103;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1101;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1098;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1100;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1099;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1102;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
