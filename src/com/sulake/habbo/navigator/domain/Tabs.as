package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_352:int = 1;
      
      public static const const_219:int = 2;
      
      public static const const_289:int = 3;
      
      public static const const_345:int = 4;
      
      public static const const_256:int = 5;
      
      public static const const_364:int = 1;
      
      public static const const_847:int = 2;
      
      public static const const_641:int = 3;
      
      public static const const_648:int = 4;
      
      public static const const_233:int = 5;
      
      public static const const_761:int = 6;
      
      public static const const_820:int = 7;
      
      public static const const_209:int = 8;
      
      public static const const_387:int = 9;
      
      public static const const_1796:int = 10;
      
      public static const const_830:int = 11;
      
      public static const const_440:int = 12;
       
      
      private var var_409:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_409 = new Array();
         this.var_409.push(new Tab(this._navigator,const_352,const_440,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_460));
         this.var_409.push(new Tab(this._navigator,const_219,const_364,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_460));
         this.var_409.push(new Tab(this._navigator,const_345,const_830,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1153));
         this.var_409.push(new Tab(this._navigator,const_289,const_233,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_460));
         this.var_409.push(new Tab(this._navigator,const_256,const_209,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_716));
         this.setSelectedTab(const_352);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_345;
      }
      
      public function get tabs() : Array
      {
         return this.var_409;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_409)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_409)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_409)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
