package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ModeratorActionMessageComposer implements IMessageComposer, IDisposable
   {
      
      public static const const_1722:int = 0;
      
      public static const const_1574:int = 1;
      
      public static const const_1493:int = 0;
      
      public static const const_1291:int = 1;
      
      public static const const_1725:int = 2;
      
      public static const const_1345:int = 3;
      
      public static const const_1442:int = 4;
       
      
      private var var_31:Array;
      
      public function ModeratorActionMessageComposer(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int = 0)
      {
         this.var_31 = new Array();
         super();
         this.var_31.push(param1);
         this.var_31.push(param2);
         this.var_31.push(param3);
         this.var_31.push(param4);
         this.var_31.push(param5);
         this.var_31.push(param6);
         this.var_31.push(false);
         this.var_31.push(false);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_31;
      }
      
      public function dispose() : void
      {
         this.var_31 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
