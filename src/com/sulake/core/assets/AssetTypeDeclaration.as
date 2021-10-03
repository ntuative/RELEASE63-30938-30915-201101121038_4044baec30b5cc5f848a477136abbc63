package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2437:String;
      
      private var var_2439:Class;
      
      private var var_2438:Class;
      
      private var var_1736:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2437 = param1;
         this.var_2439 = param2;
         this.var_2438 = param3;
         if(rest == null)
         {
            this.var_1736 = new Array();
         }
         else
         {
            this.var_1736 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2437;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2439;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2438;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1736;
      }
   }
}
