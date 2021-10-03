package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.LabelTextController;
   import com.sulake.core.window.utils.TextFieldCache;
   import flash.display.BitmapData;
   import flash.display.IBitmapDrawable;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class LabelRenderer extends SkinRenderer
   {
       
      
      protected var var_965:Matrix;
      
      public function LabelRenderer(param1:String)
      {
         super(param1);
         this.var_965 = new Matrix();
      }
      
      override public function draw(param1:IWindow, param2:IBitmapDrawable, param3:Rectangle, param4:uint, param5:Boolean) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param2 != null)
         {
            _loc6_ = LabelTextController(param1);
            _loc7_ = TextFieldCache.getTextFieldByStyle(_loc6_.textStyle);
            this.var_965.tx = _loc6_.drawOffsetX;
            this.var_965.ty = _loc6_.drawOffsetY;
            _loc7_.text = _loc6_.text;
            if(_loc7_.textColor != _loc6_.textColor)
            {
               _loc7_.textColor = _loc6_.textColor;
            }
            BitmapData(param2).draw(_loc7_,this.var_965,null,null,null,false);
         }
      }
      
      override public function isStateDrawable(param1:uint) : Boolean
      {
         return param1 == 0;
      }
   }
}
