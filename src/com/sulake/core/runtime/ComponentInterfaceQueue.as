package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1854:IID;
      
      private var var_723:Boolean;
      
      private var var_1164:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1854 = param1;
         this.var_1164 = new Array();
         this.var_723 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1854;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_723;
      }
      
      public function get receivers() : Array
      {
         return this.var_1164;
      }
      
      public function dispose() : void
      {
         if(!this.var_723)
         {
            this.var_723 = true;
            this.var_1854 = null;
            while(this.var_1164.length > 0)
            {
               this.var_1164.pop();
            }
            this.var_1164 = null;
         }
      }
   }
}
