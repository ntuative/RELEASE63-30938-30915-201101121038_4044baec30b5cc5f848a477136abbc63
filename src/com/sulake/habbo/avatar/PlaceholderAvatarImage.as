package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_658:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_723)
         {
            _structure = null;
            _assets = null;
            var_225 = null;
            var_259 = null;
            var_620 = null;
            var_517 = null;
            var_296 = null;
            if(!var_1194 && var_42)
            {
               var_42.dispose();
            }
            var_42 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_639 = null;
            var_723 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_658[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_658[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_368:
               switch(_loc3_)
               {
                  case AvatarAction.const_688:
                  case AvatarAction.const_495:
                  case AvatarAction.const_373:
                  case AvatarAction.const_729:
                  case AvatarAction.const_341:
                  case AvatarAction.const_798:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_283:
            case AvatarAction.const_614:
            case AvatarAction.const_220:
            case AvatarAction.const_670:
            case AvatarAction.const_691:
            case AvatarAction.const_590:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
