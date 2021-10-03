package com.sulake.core.utils
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class XMLVariableParser
   {
      
      public static const const_127:String = "hex";
      
      public static const const_36:String = "int";
      
      public static const const_247:String = "uint";
      
      public static const const_236:String = "Number";
      
      public static const const_1385:String = "float";
      
      public static const const_38:String = "Boolean";
      
      public static const const_1567:String = "bool";
      
      public static const const_52:String = "String";
      
      public static const const_234:String = "Point";
      
      public static const const_248:String = "Rectangle";
      
      public static const const_136:String = "Array";
      
      public static const const_206:String = "Map";
       
      
      public function XMLVariableParser()
      {
         super();
      }
      
      public static function parseVariableList(param1:XMLList, param2:Map, param3:Array = null) : uint
      {
         var _loc5_:int = 0;
         var _loc4_:uint = param1.length();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            XMLVariableParser.parseVariableToken(param1[_loc5_],param2,param3);
            _loc5_++;
         }
         return _loc4_;
      }
      
      private static function parseVariableToken(param1:XML, param2:Map, param3:Array = null) : void
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc5_:String = const_52;
         _loc7_ = param1.attribute("key");
         if(_loc7_.length() > 0)
         {
            _loc4_ = String(param1.attribute("key"));
         }
         else
         {
            _loc4_ = param1.child("key")[0];
         }
         _loc7_ = param1.attribute("type");
         if(_loc7_.length() > 0)
         {
            _loc5_ = String(param1.attribute("type"));
         }
         _loc7_ = param1.attribute("value");
         if(_loc7_.length() > 0)
         {
            _loc6_ = String(param1.attribute("value"));
         }
         if(_loc6_ != null)
         {
            param2[_loc4_] = XMLVariableParser.castStringToType(_loc6_,_loc5_);
         }
         else
         {
            _loc8_ = param1.child("value")[0];
            if(_loc8_ != null)
            {
               _loc9_ = _loc8_.child(0)[0];
               _loc6_ = _loc9_.children()[0];
               _loc5_ = _loc9_.localName();
               param2[_loc4_] = XMLVariableParser.parseValueType(_loc9_,_loc5_);
            }
            else if(_loc5_ == const_206 || _loc5_ == const_136)
            {
               param2[_loc4_] = XMLVariableParser.parseValueType(param1,_loc5_);
            }
         }
         if(param3)
         {
            param3.push(_loc5_);
         }
      }
      
      public static function castStringToType(param1:String, param2:String) : Object
      {
         switch(param2)
         {
            case const_247:
               return uint(param1);
            case const_36:
               return int(param1);
            case const_236:
               return Number(param1);
            case const_1385:
               return Number(param1);
            case const_38:
               return param1 == "true" || int(param1) > 0;
            case const_1567:
               return param1 == "true" || int(param1) > 0;
            case const_127:
               return uint(param1);
            case const_136:
               return param1.split(",");
            default:
               return String(param1);
         }
      }
      
      public static function parseValueType(param1:XML, param2:String) : Object
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         switch(param2)
         {
            case const_52:
               return String(param1);
            case const_234:
               _loc4_ = new Point();
               _loc4_.x = Number(param1.attribute("x"));
               _loc4_.y = Number(param1.attribute("y"));
               return _loc4_;
            case const_248:
               _loc5_ = new Rectangle();
               _loc5_.x = Number(param1.attribute("x"));
               _loc5_.y = Number(param1.attribute("y"));
               _loc5_.width = Number(param1.attribute("width"));
               _loc5_.height = Number(param1.attribute("height"));
               return _loc5_;
            case const_136:
               _loc3_ = new Map();
               parseVariableList(param1.children(),_loc3_);
               _loc6_ = new Array();
               for(_loc7_ in _loc3_)
               {
                  _loc6_.push(_loc3_[_loc7_]);
               }
               return _loc6_;
            case const_206:
               _loc3_ = new Map();
               XMLVariableParser.parseVariableList(param1.children(),_loc3_);
               return _loc3_;
            default:
               throw new Error("Unable to parse data type \"" + param2 + "\", unknown type!");
         }
      }
   }
}
