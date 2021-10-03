package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.events.WindowEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GestureAgentService implements IGestureAgentService, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      protected var _working:Boolean;
      
      protected var _window:IWindow;
      
      protected var var_179:Timer;
      
      protected var var_1454:uint = 0;
      
      protected var var_262:Function;
      
      protected var var_1205:int;
      
      protected var var_1204:int;
      
      public function GestureAgentService()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         this.end(this._window);
         this._disposed = true;
      }
      
      public function begin(param1:IWindow, param2:Function, param3:uint, param4:int, param5:int) : IWindow
      {
         this.var_1454 = param3;
         var _loc6_:IWindow = this._window;
         if(this._window != null)
         {
            this.end(this._window);
         }
         if(param1 && !param1.disposed)
         {
            this._window = param1;
            this._window.addEventListener(WindowEvent.const_261,this.clientWindowDestroyed);
            this.var_262 = param2;
            this._working = true;
            this.var_1205 = param4;
            this.var_1204 = param5;
            this.var_179 = new Timer(40,0);
            this.var_179.addEventListener(TimerEvent.TIMER,this.operate);
            this.var_179.start();
         }
         return _loc6_;
      }
      
      protected function operate(param1:TimerEvent) : void
      {
         this.var_1205 *= 0.75;
         this.var_1204 *= 0.75;
         if(Math.abs(this.var_1205) <= 1 && Math.abs(this.var_1204) <= 1)
         {
            this.end(this._window);
         }
         else if(this.var_262 != null)
         {
            this.var_262(this.var_1205,this.var_1204);
         }
      }
      
      public function end(param1:IWindow) : IWindow
      {
         var _loc2_:IWindow = this._window;
         if(this.var_179)
         {
            this.var_179.stop();
            this.var_179.removeEventListener(TimerEvent.TIMER,this.operate);
            this.var_179 = null;
         }
         if(this._working)
         {
            if(this._window == param1)
            {
               if(!this._window.disposed)
               {
                  this._window.removeEventListener(WindowEvent.const_261,this.clientWindowDestroyed);
               }
               this._window = null;
               this._working = false;
            }
         }
         return _loc2_;
      }
      
      private function clientWindowDestroyed(param1:WindowEvent) : void
      {
         this.end(this._window);
      }
   }
}
