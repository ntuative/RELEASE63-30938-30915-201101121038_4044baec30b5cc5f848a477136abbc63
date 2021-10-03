package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_1987:int;
      
      private var var_1988:int;
      
      private var var_1989:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_1987 = param1;
         this.var_1988 = param2;
         this.var_1989 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1987,this.var_1988,this.var_1989];
      }
      
      public function dispose() : void
      {
      }
   }
}
