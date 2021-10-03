package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_902:int = 3;
       
      
      private var var_2550:int = -1;
      
      private var var_2545:int = -2;
      
      private var var_342:Vector3d = null;
      
      private var var_404:Vector3d = null;
      
      private var var_2553:Boolean = false;
      
      private var var_2549:Boolean = false;
      
      private var var_2544:Boolean = false;
      
      private var var_2552:Boolean = false;
      
      private var var_2547:int = 0;
      
      private var var_2548:int = 0;
      
      private var var_2551:int = 0;
      
      private var var_2546:int = 0;
      
      private var var_1408:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_404;
      }
      
      public function get targetId() : int
      {
         return this.var_2550;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2545;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2553;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2549;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2544;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2552;
      }
      
      public function get screenWd() : int
      {
         return this.var_2547;
      }
      
      public function get screenHt() : int
      {
         return this.var_2548;
      }
      
      public function get roomWd() : int
      {
         return this.var_2551;
      }
      
      public function get roomHt() : int
      {
         return this.var_2546;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2550 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2545 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2553 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2549 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2544 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2552 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2547 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2548 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2551 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2546 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_342 == null)
         {
            this.var_342 = new Vector3d();
         }
         if(this.var_342.x != param1.x || this.var_342.y != param1.y || this.var_342.z != param1.z)
         {
            this.var_342.assign(param1);
            this.var_1408 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_342 = null;
         this.var_404 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_404 != null)
         {
            return;
         }
         this.var_404 = new Vector3d();
         this.var_404.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_342 != null && this.var_404 != null)
         {
            ++this.var_1408;
            _loc4_ = Vector3d.dif(this.var_342,this.var_404);
            if(_loc4_.length <= param2)
            {
               this.var_404 = this.var_342;
               this.var_342 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_902 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1408 <= const_902)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_404 = Vector3d.sum(this.var_404,_loc4_);
            }
         }
      }
   }
}
