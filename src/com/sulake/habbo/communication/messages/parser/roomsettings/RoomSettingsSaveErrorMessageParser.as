package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1710:int = 1;
      
      public static const const_1711:int = 2;
      
      public static const const_1751:int = 3;
      
      public static const const_1686:int = 4;
      
      public static const const_1491:int = 5;
      
      public static const const_1670:int = 6;
      
      public static const const_1420:int = 7;
      
      public static const const_1439:int = 8;
      
      public static const const_1721:int = 9;
      
      public static const const_1489:int = 10;
      
      public static const const_1499:int = 11;
      
      public static const const_1428:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1566:int;
      
      private var var_1419:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1566 = param1.readInteger();
         this.var_1419 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1566;
      }
      
      public function get info() : String
      {
         return this.var_1419;
      }
   }
}
