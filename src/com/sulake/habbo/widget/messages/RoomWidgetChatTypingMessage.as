package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_843:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_604:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_843);
         this.var_604 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_604;
      }
   }
}
