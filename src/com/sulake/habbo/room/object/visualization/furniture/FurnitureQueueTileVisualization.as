package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const ANIMATION_ID_ROLL:int = 3;
      
      private static const const_1196:int = 2;
      
      private static const const_1195:int = 1;
      
      private static const ANIMATION_DURATION:int = 15;
       
      
      private var var_294:Array;
      
      private var var_1012:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_294 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1196)
         {
            this.var_294 = new Array();
            this.var_294.push(const_1195);
            this.var_1012 = ANIMATION_DURATION;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_1012 > 0)
         {
            --this.var_1012;
         }
         if(this.var_1012 == 0)
         {
            if(this.var_294.length > 0)
            {
               super.setAnimation(this.var_294.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
