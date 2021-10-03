package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_486:uint = 0;
      
      public static const const_264:uint = 1;
      
      public static const const_507:uint = 2;
      
      public static const const_301:uint = 4;
      
      public static const const_937:uint = 8;
       
      
      private var _id:uint;
      
      private var _name:String;
      
      private var var_781:Array;
      
      private var _color:uint;
      
      private var var_764:uint;
      
      private var var_2338:uint;
      
      private var var_2339:uint;
      
      private var _region:Rectangle;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         this._id = param1;
         this._name = param2;
         this._region = param3;
         this._color = param4;
         this.var_764 = param5;
         this.var_2338 = param6;
         this.var_2339 = param7;
         this.var_781 = new Array();
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get tags() : Array
      {
         return this.var_781;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get blend() : uint
      {
         return this.var_764;
      }
      
      public function get region() : Rectangle
      {
         return this._region;
      }
      
      public function get scaleH() : uint
      {
         return this.var_2338;
      }
      
      public function get scaleV() : uint
      {
         return this.var_2339;
      }
      
      public function dispose() : void
      {
         this._region = null;
         this.var_781 = null;
      }
   }
}
