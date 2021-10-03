package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1353:int;
      
      private var var_289:String;
      
      private var var_2202:int;
      
      private var var_2150:int;
      
      private var var_1703:int;
      
      private var var_2201:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1353 = param1.readInteger();
         this.var_289 = param1.readString();
         this.var_2202 = param1.readInteger();
         this.var_2150 = param1.readInteger();
         this.var_1703 = param1.readInteger();
         this.var_2201 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_289;
      }
      
      public function get level() : int
      {
         return this.var_1353;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2202;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2150;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1703;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2201;
      }
   }
}
