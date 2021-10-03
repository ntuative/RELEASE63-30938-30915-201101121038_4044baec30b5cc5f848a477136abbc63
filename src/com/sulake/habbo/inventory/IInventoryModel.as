package com.sulake.habbo.inventory
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   
   public interface IInventoryModel extends IDisposable
   {
       
      
      function getWindowContainer() : IWindowContainer;
      
      function method_3(param1:int = 0) : void;
      
      function categorySwitch(param1:String) : void;
      
      function subCategorySwitch(param1:String) : void;
      
      function closingInventoryView() : void;
   }
}
