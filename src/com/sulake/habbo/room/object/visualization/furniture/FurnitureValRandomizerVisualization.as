package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_916:int = 20;
      
      private static const const_579:int = 10;
      
      private static const const_1279:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
       
      
      private var var_294:Array;
      
      private var var_674:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_294 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_674)
            {
               this.var_674 = true;
               this.var_294 = new Array();
               this.var_294.push(const_1279);
               this.var_294.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_579)
         {
            if(this.var_674)
            {
               this.var_674 = false;
               this.var_294 = new Array();
               if(_direction == 2)
               {
                  this.var_294.push(const_916 + 5 - param1);
                  this.var_294.push(const_579 + 5 - param1);
               }
               else
               {
                  this.var_294.push(const_916 + param1);
                  this.var_294.push(const_579 + param1);
               }
               this.var_294.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
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
