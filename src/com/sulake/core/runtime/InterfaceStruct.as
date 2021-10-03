package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1370:IID;
      
      private var var_1755:String;
      
      private var var_113:IUnknown;
      
      private var var_727:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1370 = param1;
         this.var_1755 = getQualifiedClassName(this.var_1370);
         this.var_113 = param2;
         this.var_727 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1370;
      }
      
      public function get iis() : String
      {
         return this.var_1755;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_113;
      }
      
      public function get references() : uint
      {
         return this.var_727;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_113 == null;
      }
      
      public function dispose() : void
      {
         this.var_1370 = null;
         this.var_1755 = null;
         this.var_113 = null;
         this.var_727 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_727;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_727) : uint(0);
      }
   }
}
