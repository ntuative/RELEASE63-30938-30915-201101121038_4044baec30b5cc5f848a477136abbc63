package com.sulake.core.window.components
{
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.utils.IMargins;
   import com.sulake.core.window.utils.PropertyDefaults;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.TextFieldCache;
   import com.sulake.core.window.utils.TextMargins;
   import com.sulake.core.window.utils.TextStyle;
   import com.sulake.core.window.utils.TextStyleManager;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class LabelTextController extends WindowController implements ILabelWindow, ILocalizable
   {
       
      
      private var var_536:uint = 4.27819008E9;
      
      private var var_361:String = "regular";
      
      private var _text:String = "";
      
      private var var_114:Boolean = false;
      
      private var var_37:TextMargins;
      
      private var var_2093:Number = 0;
      
      private var var_2094:Number = 0;
      
      private var var_1250:Boolean = false;
      
      public function LabelTextController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         TextStyleManager.events.addEventListener(Event.CHANGE,this.onTextStyleChanged);
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function get antiAliasType() : String
      {
         return this.textField.antiAliasType;
      }
      
      public function get autoSize() : String
      {
         return this.textField.autoSize;
      }
      
      public function get bold() : Boolean
      {
         return this.textField.defaultTextFormat.bold;
      }
      
      public function get border() : Boolean
      {
         return this.textField.border;
      }
      
      public function get borderColor() : uint
      {
         return this.textField.borderColor;
      }
      
      public function get defaultTextFormat() : TextFormat
      {
         return this.textField.defaultTextFormat;
      }
      
      public function get embedFonts() : Boolean
      {
         return this.textField.embedFonts;
      }
      
      public function get fontFace() : String
      {
         return this.textField.defaultTextFormat.font;
      }
      
      public function get fontSize() : uint
      {
         return this.textField.defaultTextFormat.size == null ? 12 : uint(uint(this.textField.defaultTextFormat.size));
      }
      
      public function get gridFitType() : String
      {
         return this.textField.gridFitType;
      }
      
      public function get italic() : Boolean
      {
         return this.textField.defaultTextFormat.italic;
      }
      
      public function get kerning() : Boolean
      {
         return this.textField.defaultTextFormat.kerning;
      }
      
      public function get length() : int
      {
         return this._text.length;
      }
      
      public function get margins() : IMargins
      {
         if(!this.var_37)
         {
            this.var_37 = new TextMargins(0,0,0,0,this.setTextMargins);
         }
         return this.var_37;
      }
      
      public function get maxChars() : int
      {
         return this.textField.maxChars;
      }
      
      public function get sharpness() : Number
      {
         return this.textField.sharpness;
      }
      
      public function get spacing() : Number
      {
         return Number(this.textField.defaultTextFormat.letterSpacing);
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get textColor() : uint
      {
         return this.var_536;
      }
      
      public function get textBackground() : Boolean
      {
         return background;
      }
      
      public function get textBackgroundColor() : uint
      {
         return color;
      }
      
      public function get textHeight() : Number
      {
         return this.var_2093;
      }
      
      public function get textWidth() : Number
      {
         return this.var_2094;
      }
      
      public function get textStyle() : TextStyle
      {
         return TextStyleManager.getStyle(this.var_361);
      }
      
      public function get thickness() : Number
      {
         return this.textField.thickness;
      }
      
      public function get underline() : Boolean
      {
         return this.textField.defaultTextFormat.underline;
      }
      
      public function get drawOffsetX() : int
      {
         return !!this.var_37 ? int(this.var_37.left) : 0;
      }
      
      public function get drawOffsetY() : int
      {
         return !!this.var_37 ? int(this.var_37.top) : 0;
      }
      
      protected function get textField() : TextField
      {
         var _loc1_:TextField = TextFieldCache.getTextFieldByStyleName(this.var_361);
         if(_loc1_)
         {
            _loc1_.text = this._text;
            if(_loc1_.textColor != this.var_536)
            {
               _loc1_.textColor = this.var_536;
            }
         }
         return _loc1_;
      }
      
      public function set text(param1:String) : void
      {
         if(param1 == null || disposed)
         {
            return;
         }
         if(this.var_114)
         {
            context.removeLocalizationListener(var_24,this);
            this.var_114 = false;
         }
         var_24 = param1;
         if(var_24.charAt(0) == "$" && var_24.charAt(1) == "{")
         {
            context.registerLocalizationListener(var_24.slice(2,var_24.indexOf("}")),this);
            this.var_114 = true;
         }
         else
         {
            this._text = param1;
            this.refresh();
         }
      }
      
      override public function set caption(param1:String) : void
      {
         this.text = param1;
      }
      
      public function set localization(param1:String) : void
      {
         if(param1 != null && !disposed)
         {
            this._text = param1;
            this.refresh();
         }
      }
      
      public function set textStyle(param1:TextStyle) : void
      {
         if(this.var_361 != param1.name)
         {
            this.var_361 = param1.name;
            this.refresh();
         }
      }
      
      public function set textColor(param1:uint) : void
      {
         if(param1 != this.var_536)
         {
            this.var_536 = param1;
            this.refresh();
         }
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            TextStyleManager.events.removeEventListener(Event.CHANGE,this.onTextStyleChanged);
            if(this.var_114)
            {
               this.var_114 = false;
               context.removeLocalizationListener(var_24,this);
            }
            if(this.var_37)
            {
               this.var_37.dispose();
               this.var_37 = null;
            }
            super.dispose();
         }
      }
      
      private function refresh(param1:Boolean = false) : void
      {
         var marginWidth:int = 0;
         var marginHeight:int = 0;
         var actualWidth:int = 0;
         var actualHeight:int = 0;
         var fieldWidth:int = 0;
         var resizing:Boolean = param1;
         if(this.var_1250)
         {
            return;
         }
         this.var_1250 = true;
         var field:TextField = this.textField;
         if(!field)
         {
            this.var_1250 = false;
            return;
         }
         this.var_2094 = field.textWidth;
         this.var_2093 = field.textHeight;
         try
         {
            marginWidth = !!this.var_37 ? int(this.var_37.left + this.var_37.right) : 0;
            marginHeight = !!this.var_37 ? int(this.var_37.top + this.var_37.bottom) : 0;
            actualWidth = 0 - marginWidth;
            actualHeight = 0 - marginHeight;
            fieldWidth = Math.floor(field.width) + (!!field.border ? 1 : 0);
         }
         catch(e:Error)
         {
         }
         var resized:Boolean = false;
         if(fieldWidth != actualWidth)
         {
            setRectangle(var_11.x,var_11.y,fieldWidth + marginWidth,Math.floor(field.height) + marginHeight);
            resized = true;
         }
         if(field.height + (!!field.border ? 1 : 0) < actualHeight)
         {
            field.height = actualHeight - (!!field.border ? 1 : 0);
         }
         else if(field.height + (!!field.border ? 1 : 0) > actualHeight)
         {
            setRectangle(var_11.x,var_11.y,fieldWidth + marginWidth,Math.floor(field.height) + marginHeight);
            resized = true;
         }
         this.var_1250 = false;
         var_15.invalidate(this,var_11,WindowRedrawFlag.const_63);
         if(!resized && !resizing)
         {
            dispatchEvent(new WindowEvent(WindowEvent.const_45,this,null));
         }
      }
      
      private function setTextMargins(param1:IMargins) : void
      {
         if(param1 && param1 != this.var_37)
         {
            if(this.var_37)
            {
               this.var_37.assign(param1.left,param1.top,param1.right,param1.bottom,this.setTextMargins);
            }
            else
            {
               this.var_37 = new TextMargins(param1.left,param1.top,param1.right,param1.bottom,this.setTextMargins);
            }
         }
         this.refresh();
      }
      
      private function onTextStyleChanged(param1:Event) : void
      {
         this.refresh();
      }
      
      private function setTextMarginMap(param1:Map) : void
      {
         if(this.var_37)
         {
            this.var_37.assign(int(param1["left"]),int(param1["top"]),int(param1["right"]),int(param1["bottom"]),this.setTextMargins);
         }
         else
         {
            this.var_37 = new TextMargins(int(param1["left"]),int(param1["top"]),int(param1["right"]),int(param1["bottom"]),this.setTextMargins);
         }
         this.refresh();
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         if(this.var_361 != TextStyleManager.const_181)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_451,this.var_361,PropertyStruct.const_52,true,PropertyDefaults.const_854));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_1031);
         }
         _loc1_.push(new PropertyStruct(PropertyDefaults.const_597,this.var_536,PropertyStruct.const_127,this.var_536 != TextStyleManager.getStyle(this.var_361).color));
         if(this.var_37)
         {
            if(this.var_37.left != PropertyDefaults.const_632)
            {
               _loc1_.push(new PropertyStruct(PropertyDefaults.const_297,this.var_37.left,PropertyStruct.const_36,true));
            }
            else
            {
               _loc1_.push(PropertyDefaults.const_414);
            }
            if(this.var_37.top != PropertyDefaults.const_817)
            {
               _loc1_.push(new PropertyStruct(PropertyDefaults.const_272,this.var_37.top,PropertyStruct.const_36,true));
            }
            else
            {
               _loc1_.push(PropertyDefaults.const_445);
            }
            if(this.var_37.right != PropertyDefaults.const_795)
            {
               _loc1_.push(new PropertyStruct(PropertyDefaults.const_300,this.var_37.right,PropertyStruct.const_36,true));
            }
            else
            {
               _loc1_.push(PropertyDefaults.const_556);
            }
            if(this.var_37.bottom != PropertyDefaults.const_735)
            {
               _loc1_.push(new PropertyStruct(PropertyDefaults.const_271,this.var_37.bottom,PropertyStruct.const_36,true));
            }
            else
            {
               _loc1_.push(PropertyDefaults.const_429);
            }
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_414);
            _loc1_.push(PropertyDefaults.const_445);
            _loc1_.push(PropertyDefaults.const_556);
            _loc1_.push(PropertyDefaults.const_429);
         }
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case "text_style":
                  this.textStyle = TextStyleManager.getStyle(_loc2_.value as String);
                  break;
               case "text_color":
                  this.var_536 = _loc2_.value as uint;
                  break;
               case "margins":
                  this.setTextMarginMap(_loc2_.value as Map);
                  break;
               case "margin_left":
                  if(this.var_37 || _loc2_.valid)
                  {
                     this.margins.left = _loc2_.value as int;
                  }
                  break;
               case "margin_top":
                  if(this.var_37 || _loc2_.valid)
                  {
                     this.margins.top = _loc2_.value as int;
                  }
                  break;
               case "margin_right":
                  if(this.var_37 || _loc2_.valid)
                  {
                     this.margins.right = _loc2_.value as int;
                  }
                  break;
               case "margin_bottom":
                  if(this.var_37 || _loc2_.valid)
                  {
                     this.margins.bottom = _loc2_.value as int;
                  }
                  break;
            }
         }
         super.properties = param1;
      }
   }
}
