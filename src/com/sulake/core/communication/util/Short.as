package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_741:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         this.var_741 = new ByteArray();
         this.var_741.writeShort(param1);
         this.var_741.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         this.var_741.position = 0;
         if(this.var_741.bytesAvailable)
         {
            _loc1_ = this.var_741.readShort();
            this.var_741.position = 0;
         }
         return _loc1_;
      }
   }
}
