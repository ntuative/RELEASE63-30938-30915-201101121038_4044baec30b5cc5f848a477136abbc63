package com.sulake.habbo.help.help.data
{
   import com.sulake.core.utils.Map;
   
   public class FaqIndex
   {
       
      
      private var var_744:FaqCategory;
      
      private var var_742:FaqCategory;
      
      private var var_743:FaqCategory;
      
      private var var_151:Map;
      
      private var _lastUpdatedQuestionId:int;
      
      private var var_2729:int;
      
      public function FaqIndex()
      {
         super();
         this.var_744 = new FaqCategory(-999,"${help.faq.title.urgent}");
         this.var_742 = new FaqCategory(-9999,"${help.faq.title.normal}");
         this.var_743 = new FaqCategory(-99999,"${help.faq.title.searchresults}");
         this.var_151 = new Map();
      }
      
      public function get lastUpdatedQuestionId() : int
      {
         return this._lastUpdatedQuestionId;
      }
      
      public function get lastUpdatedCategoryId() : int
      {
         return this.var_2729;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_151 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_151.length)
            {
               _loc2_ = this.var_151.getWithIndex(_loc1_);
               _loc2_.dispose();
               _loc1_++;
            }
            this.var_151.dispose();
            this.var_151 = null;
         }
         this.var_744.dispose();
         this.var_742.dispose();
         this.var_743.dispose();
      }
      
      public function getCategory(param1:int, param2:String = null, param3:Boolean = false) : FaqCategory
      {
         var _loc4_:FaqCategory = this.var_151.getValue(param1);
         if(_loc4_ != null || !param3)
         {
            return _loc4_;
         }
         _loc4_ = new FaqCategory(param1,param2);
         this.var_151.add(param1,_loc4_);
         return _loc4_;
      }
      
      public function getItem(param1:int, param2:int = -1) : FaqItem
      {
         if(param2 < 0)
         {
            return this.findItem(param1);
         }
         var _loc3_:FaqCategory = this.getCategory(param2);
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.getItem(param1);
      }
      
      public function storeAnswerText(param1:int, param2:String) : void
      {
         var _loc4_:* = null;
         if(this.var_744.hasItem(param1))
         {
            this.var_744.getItem(param1).answerText = param2;
         }
         if(this.var_742.hasItem(param1))
         {
            this.var_742.getItem(param1).answerText = param2;
         }
         if(this.var_743.hasItem(param1))
         {
            this.var_743.getItem(param1).answerText = param2;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.var_151.length)
         {
            _loc4_ = this.var_151.getWithIndex(_loc3_);
            if(_loc4_.hasItem(param1))
            {
               _loc4_.getItem(param1).answerText = param2;
            }
            _loc3_++;
         }
      }
      
      public function getFrontPageUrgentCategory() : FaqCategory
      {
         return this.var_744;
      }
      
      public function getFrontPageNormalCategory() : FaqCategory
      {
         return this.var_742;
      }
      
      public function getSearchResultCategory() : FaqCategory
      {
         return this.var_743;
      }
      
      public function getCategoryCount() : int
      {
         return this.var_151.length;
      }
      
      public function getCategoryByIndex(param1:int) : FaqCategory
      {
         if(param1 >= this.var_151.length)
         {
            return null;
         }
         return this.var_151.getWithIndex(param1);
      }
      
      public function getCategoryTitleArray() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < this.var_151.length)
         {
            _loc2_ = this.var_151.getWithIndex(_loc3_);
            if(_loc2_ != null)
            {
               _loc1_.push(_loc2_.categoryTitle);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      private function findItem(param1:int) : FaqItem
      {
         var _loc3_:* = null;
         if(this.var_744.hasItem(param1))
         {
            return this.var_744.getItem(param1);
         }
         if(this.var_742.hasItem(param1))
         {
            return this.var_742.getItem(param1);
         }
         if(this.var_743.hasItem(param1))
         {
            return this.var_743.getItem(param1);
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.var_151.length)
         {
            _loc3_ = this.var_151.getWithIndex(_loc2_);
            if(_loc3_.hasItem(param1))
            {
               return _loc3_.getItem(param1);
            }
            _loc2_++;
         }
         return null;
      }
   }
}
