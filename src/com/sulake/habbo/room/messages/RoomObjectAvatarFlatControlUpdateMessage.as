package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFlatControlUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1999:Boolean = false;
      
      private var var_1998:String;
      
      public function RoomObjectAvatarFlatControlUpdateMessage(param1:String)
      {
         super();
         this.var_1998 = param1;
         if(param1 != null && param1.indexOf("useradmin") != -1)
         {
            this.var_1999 = true;
         }
      }
      
      public function get isAdmin() : Boolean
      {
         return this.var_1999;
      }
      
      public function get rawData() : String
      {
         return this.var_1998;
      }
   }
}
