package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1684:int;
      
      private var _name:String;
      
      private var var_1353:int;
      
      private var var_2350:int;
      
      private var var_2152:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_620:String;
      
      private var var_2349:int;
      
      private var var_2351:int;
      
      private var var_2352:int;
      
      private var var_2180:int;
      
      private var var_2239:int;
      
      private var _ownerName:String;
      
      private var var_478:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1684;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1353;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2350;
      }
      
      public function get experience() : int
      {
         return this.var_2152;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2349;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2351;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2352;
      }
      
      public function get respect() : int
      {
         return this.var_2180;
      }
      
      public function get ownerId() : int
      {
         return this.var_2239;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_478;
      }
      
      public function flush() : Boolean
      {
         this.var_1684 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1684 = param1.readInteger();
         this._name = param1.readString();
         this.var_1353 = param1.readInteger();
         this.var_2350 = param1.readInteger();
         this.var_2152 = param1.readInteger();
         this.var_2349 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2351 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2352 = param1.readInteger();
         this.var_620 = param1.readString();
         this.var_2180 = param1.readInteger();
         this.var_2239 = param1.readInteger();
         this.var_478 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
