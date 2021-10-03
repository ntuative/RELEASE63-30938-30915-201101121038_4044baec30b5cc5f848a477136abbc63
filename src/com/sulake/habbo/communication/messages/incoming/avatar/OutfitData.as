package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1858:int;
      
      private var var_2643:String;
      
      private var var_938:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1858 = param1.readInteger();
         this.var_2643 = param1.readString();
         this.var_938 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1858;
      }
      
      public function get figureString() : String
      {
         return this.var_2643;
      }
      
      public function get gender() : String
      {
         return this.var_938;
      }
   }
}
