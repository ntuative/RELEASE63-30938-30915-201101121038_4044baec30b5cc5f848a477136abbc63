package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1370:String = "pricing_model_unknown";
      
      public static const const_494:String = "pricing_model_single";
      
      public static const const_542:String = "pricing_model_multi";
      
      public static const const_478:String = "pricing_model_bundle";
      
      public static const const_1382:String = "price_type_none";
      
      public static const const_680:String = "price_type_credits";
      
      public static const const_1019:String = "price_type_activitypoints";
      
      public static const const_1017:String = "price_type_credits_and_activitypoints";
       
      
      private var var_688:String;
      
      private var var_1054:String;
      
      private var _offerId:int;
      
      private var var_1610:String;
      
      private var var_1055:int;
      
      private var var_1053:int;
      
      private var var_1611:int;
      
      private var var_363:ICatalogPage;
      
      private var var_687:IProductContainer;
      
      private var var_2209:int;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1610 = param1.localizationId;
         this.var_1055 = param1.priceInCredits;
         this.var_1053 = param1.priceInActivityPoints;
         this.var_1611 = param1.activityPointType;
         this.var_363 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_363;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1610;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1055;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1053;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1611;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_687;
      }
      
      public function get pricingModel() : String
      {
         return this.var_688;
      }
      
      public function get priceType() : String
      {
         return this.var_1054;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2209;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2209 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1610 = "";
         this.var_1055 = 0;
         this.var_1053 = 0;
         this.var_1611 = 0;
         this.var_363 = null;
         if(this.var_687 != null)
         {
            this.var_687.dispose();
            this.var_687 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_688)
         {
            case const_494:
               this.var_687 = new SingleProductContainer(this,param1);
               break;
            case const_542:
               this.var_687 = new MultiProductContainer(this,param1);
               break;
            case const_478:
               this.var_687 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_688);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_688 = const_494;
            }
            else
            {
               this.var_688 = const_542;
            }
         }
         else if(param1.length > 1)
         {
            this.var_688 = const_478;
         }
         else
         {
            this.var_688 = const_1370;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1055 > 0 && this.var_1053 > 0)
         {
            this.var_1054 = const_1017;
         }
         else if(this.var_1055 > 0)
         {
            this.var_1054 = const_680;
         }
         else if(this.var_1053 > 0)
         {
            this.var_1054 = const_1019;
         }
         else
         {
            this.var_1054 = const_1382;
         }
      }
   }
}
