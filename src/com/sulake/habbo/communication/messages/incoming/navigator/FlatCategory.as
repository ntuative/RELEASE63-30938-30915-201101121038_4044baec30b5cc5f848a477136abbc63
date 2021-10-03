package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1574:int;
      
      private var var_2017:String;
      
      private var var_358:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1574 = param1.readInteger();
         this.var_2017 = param1.readString();
         this.var_358 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1574;
      }
      
      public function get nodeName() : String
      {
         return this.var_2017;
      }
      
      public function get visible() : Boolean
      {
         return this.var_358;
      }
   }
}
