package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_183:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_226:String = "RWUIUE_PEER";
      
      public static const const_1452:int = 0;
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const const_1066:int = 2;
      
      public static const const_1148:int = 3;
      
      public static const const_1517:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1845:String = "";
      
      private var var_1992:int;
      
      private var var_1995:int = 0;
      
      private var var_1994:int = 0;
      
      private var var_620:String = "";
      
      private var var_42:BitmapData = null;
      
      private var var_245:Array;
      
      private var var_1264:int = 0;
      
      private var var_2254:String = "";
      
      private var var_2253:int = 0;
      
      private var var_2252:int = 0;
      
      private var var_1569:Boolean = false;
      
      private var var_1699:String = "";
      
      private var var_2371:Boolean = false;
      
      private var var_2375:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2378:Boolean = false;
      
      private var var_2372:Boolean = false;
      
      private var var_2376:Boolean = false;
      
      private var var_2373:Boolean = false;
      
      private var var_2374:Boolean = false;
      
      private var var_2377:Boolean = false;
      
      private var var_2370:int = 0;
      
      private var var_1570:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_245 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1845 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1845;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_1992 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_1992;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_1995 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_1995;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_1994 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_1994;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_620 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_42 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_42;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_245 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_245;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1264 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1264;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2254 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2254;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2371 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2371;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2378 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2378;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2372 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2372;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2376 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2376;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2373 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2373;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2374 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2374;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2377 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2377;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2370 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2370;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2375 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2375;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1570 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1570;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2253 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2253;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2252 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2252;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1569 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1569;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1699 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1699;
      }
   }
}
