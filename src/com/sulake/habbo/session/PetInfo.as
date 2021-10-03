package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1684:int;
      
      private var var_1353:int;
      
      private var var_2285:int;
      
      private var var_2152:int;
      
      private var var_2286:int;
      
      private var _energy:int;
      
      private var var_2288:int;
      
      private var _nutrition:int;
      
      private var var_2287:int;
      
      private var var_2239:int;
      
      private var _ownerName:String;
      
      private var var_2180:int;
      
      private var var_478:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1684;
      }
      
      public function get level() : int
      {
         return this.var_1353;
      }
      
      public function get levelMax() : int
      {
         return this.var_2285;
      }
      
      public function get experience() : int
      {
         return this.var_2152;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2286;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2288;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2287;
      }
      
      public function get ownerId() : int
      {
         return this.var_2239;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2180;
      }
      
      public function get age() : int
      {
         return this.var_478;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1684 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1353 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2285 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2152 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2286 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2288 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2287 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2239 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2180 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_478 = param1;
      }
   }
}
