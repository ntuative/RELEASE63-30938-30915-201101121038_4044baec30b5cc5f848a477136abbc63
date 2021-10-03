package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var _id:int;
      
      private var var_2607:String = "";
      
      private var var_938:String;
      
      private var var_1307:Boolean;
      
      private var var_2178:Boolean = true;
      
      private var var_2608:int;
      
      private var var_2606:String;
      
      public function Breed(param1:XML)
      {
         super(param1);
         this._id = parseInt(param1.@id);
         this.var_2608 = parseInt(param1.@pattern);
         this.var_938 = String(param1.@gender);
         this.var_1307 = Boolean(parseInt(param1.@colorable));
         this.var_2607 = String(param1.@localizationKey);
         if(param1.@sellable && param1.@sellable == "0")
         {
            this.var_2178 = false;
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get gender() : String
      {
         return this.var_938;
      }
      
      public function get isColorable() : Boolean
      {
         return this.var_1307;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2178;
      }
      
      public function get patternId() : int
      {
         return this.var_2608;
      }
      
      public function get avatarFigureString() : String
      {
         return this.var_2606;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         this.var_2606 = param1;
      }
      
      public function get localizationKey() : String
      {
         return this.var_2607;
      }
   }
}
