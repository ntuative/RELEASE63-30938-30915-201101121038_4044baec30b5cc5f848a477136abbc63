package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2619:Number;
      
      private var var_1773:Number;
      
      private var var_936:Number;
      
      private var var_935:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2619 = param1;
         this.var_1773 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_936 = param1;
         this.var_935 = 0;
      }
      
      public function update() : void
      {
         this.var_936 += this.var_1773;
         this.var_935 += this.var_936;
         if(this.var_935 > 0)
         {
            this.var_935 = 0;
            this.var_936 = this.var_2619 * -1 * this.var_936;
         }
      }
      
      public function get location() : Number
      {
         return this.var_935;
      }
   }
}
