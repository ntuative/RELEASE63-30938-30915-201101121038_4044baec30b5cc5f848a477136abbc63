package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_581:String = "";
      
      public static const const_546:int = 0;
      
      public static const const_435:int = 255;
      
      public static const const_673:Boolean = false;
      
      public static const const_502:int = 0;
      
      public static const const_454:int = 0;
      
      public static const const_404:int = 0;
      
      public static const const_1003:int = 1;
      
      public static const const_1128:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2043:String = "";
      
      private var var_1745:int = 0;
      
      private var var_2042:int = 255;
      
      private var var_2360:Boolean = false;
      
      private var var_2362:int = 0;
      
      private var var_2361:int = 0;
      
      private var var_2363:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2043 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2043;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1745 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1745;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2042 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2042;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2360 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2360;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2362 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2362;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2361 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2361;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2363 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2363;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
