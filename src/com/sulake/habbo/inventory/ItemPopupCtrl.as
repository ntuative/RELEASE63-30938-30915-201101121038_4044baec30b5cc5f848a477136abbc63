package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      public static const const_1089:int = 1;
      
      public static const const_544:int = 2;
      
      private static const const_875:int = 5;
      
      private static const const_1197:int = 250;
      
      private static const const_1199:int = 100;
      
      private static const const_1200:int = 180;
      
      private static const const_1198:int = 200;
       
      
      private var var_313:Timer;
      
      private var var_312:Timer;
      
      private var _assets:IAssetLibrary;
      
      private var var_72:IWindowContainer;
      
      private var _parent:IWindowContainer;
      
      private var var_1550:int = 2;
      
      private var var_677:BitmapData;
      
      private var var_834:BitmapData;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         this.var_313 = new Timer(const_1197,1);
         this.var_312 = new Timer(const_1199,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         this.var_72 = param1;
         this.var_72.visible = false;
         this._assets = param2;
         this.var_313.addEventListener(TimerEvent.TIMER,this.onDisplayTimer);
         this.var_312.addEventListener(TimerEvent.TIMER,this.onHideTimer);
         var _loc3_:BitmapDataAsset = this._assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_834 = _loc3_.content as BitmapData;
         }
         _loc3_ = this._assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_677 = _loc3_.content as BitmapData;
         }
      }
      
      public function dispose() : void
      {
         if(this.var_313 != null)
         {
            this.var_313.removeEventListener(TimerEvent.TIMER,this.onDisplayTimer);
            this.var_313.stop();
            this.var_313 = null;
         }
         if(this.var_312 != null)
         {
            this.var_312.removeEventListener(TimerEvent.TIMER,this.onHideTimer);
            this.var_312.stop();
            this.var_312 = null;
         }
         this._assets = null;
         this.var_72 = null;
         this._parent = null;
         this.var_677 = null;
         this.var_834 = null;
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(this.var_72 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_72);
         }
         this._parent = param1;
         this.var_1550 = param4;
         var _loc5_:ITextWindow = ITextWindow(this.var_72.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = this.var_72.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1200,param3.width),Math.min(const_1198,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (this.var_72.width - _loc6_.width) / 2;
            this.var_72.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      public function show() : void
      {
         this.var_312.reset();
         this.var_313.reset();
         if(this._parent == null)
         {
            return;
         }
         this.var_72.visible = true;
         this._parent.addChild(this.var_72);
         this.refreshArrow(this.var_1550);
         switch(this.var_1550)
         {
            case const_1089:
               this.var_72.x = -1 * this.var_72.width - const_875;
               break;
            case const_544:
               this.var_72.x = this._parent.width + const_875;
         }
         this.var_72.y = (this._parent.height - this.var_72.height) / 2;
      }
      
      public function hide() : void
      {
         this.var_72.visible = false;
         this.var_312.reset();
         this.var_313.reset();
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_72);
         }
      }
      
      public function showDelayed() : void
      {
         this.var_312.reset();
         this.var_313.reset();
         this.var_313.start();
      }
      
      public function hideDelayed() : void
      {
         this.var_312.reset();
         this.var_313.reset();
         this.var_312.start();
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(this.var_72 == null || this.var_72.disposed)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this.var_72.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_1089:
               _loc2_.bitmap = this.var_834.clone();
               _loc2_.width = this.var_834.width;
               _loc2_.height = this.var_834.height;
               _loc2_.y = (this.var_72.height - this.var_834.height) / 2;
               _loc2_.x = this.var_72.width - 1;
               break;
            case const_544:
               _loc2_.bitmap = this.var_677.clone();
               _loc2_.width = this.var_677.width;
               _loc2_.height = this.var_677.height;
               _loc2_.y = (this.var_72.height - this.var_677.height) / 2;
               _loc2_.x = -1 * this.var_677.width + 1;
         }
         _loc2_.invalidate();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.show();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         this.hide();
      }
   }
}
