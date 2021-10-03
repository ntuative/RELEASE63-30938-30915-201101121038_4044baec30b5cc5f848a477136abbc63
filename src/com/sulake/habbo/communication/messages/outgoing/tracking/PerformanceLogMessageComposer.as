package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2217:int = 0;
      
      private var var_1415:String = "";
      
      private var var_1822:String = "";
      
      private var var_2214:String = "";
      
      private var var_2219:String = "";
      
      private var var_1616:int = 0;
      
      private var var_2218:int = 0;
      
      private var var_2215:int = 0;
      
      private var var_1414:int = 0;
      
      private var var_2216:int = 0;
      
      private var var_1413:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2217 = param1;
         this.var_1415 = param2;
         this.var_1822 = param3;
         this.var_2214 = param4;
         this.var_2219 = param5;
         if(param6)
         {
            this.var_1616 = 1;
         }
         else
         {
            this.var_1616 = 0;
         }
         this.var_2218 = param7;
         this.var_2215 = param8;
         this.var_1414 = param9;
         this.var_2216 = param10;
         this.var_1413 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2217,this.var_1415,this.var_1822,this.var_2214,this.var_2219,this.var_1616,this.var_2218,this.var_2215,this.var_1414,this.var_2216,this.var_1413];
      }
   }
}
