package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_78:String = "i";
      
      public static const const_79:String = "s";
      
      public static const const_259:String = "e";
       
      
      private var var_1592:String;
      
      private var var_2022:int;
      
      private var var_1295:String;
      
      private var var_1294:int;
      
      private var var_1593:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1592 = param1.readString();
         this.var_2022 = param1.readInteger();
         this.var_1295 = param1.readString();
         this.var_1294 = param1.readInteger();
         this.var_1593 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1592;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2022;
      }
      
      public function get extraParam() : String
      {
         return this.var_1295;
      }
      
      public function get productCount() : int
      {
         return this.var_1294;
      }
      
      public function get expiration() : int
      {
         return this.var_1593;
      }
   }
}
