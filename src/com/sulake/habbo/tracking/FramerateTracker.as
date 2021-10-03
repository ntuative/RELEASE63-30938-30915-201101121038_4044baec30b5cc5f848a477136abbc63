package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1499:int;
      
      private var var_2054:int;
      
      private var var_985:int;
      
      private var var_495:Number;
      
      private var var_2055:Boolean;
      
      private var var_2053:int;
      
      private var var_1500:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2054 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2053 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2055 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_985;
         if(this.var_985 == 1)
         {
            this.var_495 = param1;
            this.var_1499 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_985);
            this.var_495 = this.var_495 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2055 && param3 - this.var_1499 >= this.var_2054 && this.var_1500 < this.var_2053)
         {
            _loc5_ = 1000 / this.var_495;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1500;
            this.var_1499 = param3;
            this.var_985 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
