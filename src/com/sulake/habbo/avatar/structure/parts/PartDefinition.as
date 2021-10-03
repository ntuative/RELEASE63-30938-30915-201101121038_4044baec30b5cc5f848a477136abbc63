package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2016:String;
      
      private var var_1481:String;
      
      private var var_2015:String;
      
      private var var_1480:Boolean;
      
      private var var_1479:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2016 = String(param1["set-type"]);
         this.var_1481 = String(param1["flipped-set-type"]);
         this.var_2015 = String(param1["remove-set-type"]);
         this.var_1480 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1479 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1479;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1479 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2016;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1481;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2015;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1480;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1480 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1481 = param1;
      }
   }
}
