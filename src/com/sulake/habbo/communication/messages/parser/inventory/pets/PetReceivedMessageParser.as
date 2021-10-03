package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1710:Boolean;
      
      private var var_1096:PetData;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1710 = param1.readBoolean();
         this.var_1096 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_1710 + ", " + this.var_1096.id + ", " + this.var_1096.name + ", " + this.pet.figure + ", " + this.var_1096.type);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_1710;
      }
      
      public function get pet() : PetData
      {
         return this.var_1096;
      }
   }
}
