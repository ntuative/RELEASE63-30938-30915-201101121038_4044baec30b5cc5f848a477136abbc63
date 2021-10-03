package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_916:int = 20;
      
      private static const const_579:int = 9;
      
      private static const ANIMATION_ID_ROLL:int = -1;
       
      
      private var var_294:Array;
      
      private var var_674:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_294 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_674)
            {
               this.var_674 = true;
               this.var_294 = new Array();
               this.var_294.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_674)
            {
               this.var_674 = false;
               this.var_294 = new Array();
               this.var_294.push(const_916);
               this.var_294.push(const_579 + param1);
               this.var_294.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(0))
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
