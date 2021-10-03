package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1353:int;
      
      private var var_2285:int;
      
      private var var_2152:int;
      
      private var var_2286:int;
      
      private var _energy:int;
      
      private var var_2288:int;
      
      private var _nutrition:int;
      
      private var var_2287:int;
      
      private var _petRespect:int;
      
      private var _name:String = "";
      
      private var var_1684:int = -1;
      
      private var _type:int;
      
      private var var_2259:int;
      
      private var var_42:BitmapData;
      
      private var var_2610:Boolean;
      
      private var var_2239:int;
      
      private var _ownerName:String;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_2609:int;
      
      private var var_478:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : int
      {
         return this.var_1684;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get race() : int
      {
         return this.var_2259;
      }
      
      public function get image() : BitmapData
      {
         return this.var_42;
      }
      
      public function get isOwnPet() : Boolean
      {
         return this.var_2610;
      }
      
      public function get ownerId() : int
      {
         return this.var_2239;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return this._canOwnerBeKicked;
      }
      
      public function get age() : int
      {
         return this.var_478;
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
      
      public function get petRespect() : int
      {
         return this._petRespect;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2609;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this._name = param1.name;
         this.var_1684 = param1.id;
         this._type = param1.petType;
         this.var_2259 = param1.petRace;
         this.var_42 = param1.image;
         this.var_2610 = param1.isOwnPet;
         this.var_2239 = param1.ownerId;
         this._ownerName = param1.ownerName;
         this._canOwnerBeKicked = param1.canOwnerBeKicked;
         this.var_1353 = param1.level;
         this.var_2285 = param1.levelMax;
         this.var_2152 = param1.experience;
         this.var_2286 = param1.experienceMax;
         this._energy = param1.energy;
         this.var_2288 = param1.energyMax;
         this._nutrition = param1.nutrition;
         this.var_2287 = param1.nutritionMax;
         this._petRespect = param1.petRespect;
         this.var_2609 = param1.roomIndex;
         this.var_478 = param1.age;
      }
   }
}
