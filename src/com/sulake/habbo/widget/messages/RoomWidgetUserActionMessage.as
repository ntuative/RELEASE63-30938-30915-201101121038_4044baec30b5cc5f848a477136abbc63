package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_708:String = "RWUAM_WHISPER_USER";
      
      public static const const_618:String = "RWUAM_IGNORE_USER";
      
      public static const const_701:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_483:String = "RWUAM_KICK_USER";
      
      public static const const_630:String = "RWUAM_BAN_USER";
      
      public static const const_848:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_740:String = "RWUAM_RESPECT_USER";
      
      public static const const_611:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_668:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_723:String = "RWUAM_START_TRADING";
      
      public static const const_727:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_408:String = "RWUAM_KICK_BOT";
      
      public static const const_671:String = "RWUAM_REPORT";
      
      public static const const_463:String = "RWUAM_PICKUP_PET";
      
      public static const const_1464:String = "RWUAM_TRAIN_PET";
      
      public static const const_407:String = " RWUAM_RESPECT_PET";
      
      public static const const_365:String = "RWUAM_REQUEST_PET_UPDATE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
