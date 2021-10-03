package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1746:int = 0;
      
      public static const const_1375:int = 1;
      
      public static const const_1437:int = 2;
      
      public static const const_1843:int = 3;
      
      public static const const_1672:int = 4;
      
      public static const const_1663:int = 5;
      
      public static const const_1349:int = 10;
      
      public static const const_1849:int = 11;
      
      public static const const_1758:int = 12;
      
      public static const const_1780:int = 13;
      
      public static const const_1851:int = 16;
      
      public static const const_1650:int = 17;
      
      public static const const_1785:int = 18;
      
      public static const const_1771:int = 19;
      
      public static const const_1677:int = 20;
      
      public static const const_1813:int = 22;
      
      public static const const_1684:int = 23;
      
      public static const const_1858:int = 24;
      
      public static const const_1799:int = 25;
      
      public static const const_1776:int = 26;
      
      public static const const_1704:int = 27;
      
      public static const const_1748:int = 28;
      
      public static const const_1633:int = 29;
      
      public static const const_1775:int = 100;
      
      public static const const_1735:int = 101;
      
      public static const const_1674:int = 102;
      
      public static const const_1749:int = 103;
      
      public static const const_1729:int = 104;
      
      public static const const_1717:int = 105;
      
      public static const const_1763:int = 106;
      
      public static const const_1766:int = 107;
      
      public static const const_1655:int = 108;
      
      public static const const_1676:int = 109;
      
      public static const const_1720:int = 110;
      
      public static const const_1724:int = 111;
      
      public static const const_1863:int = 112;
      
      public static const const_1743:int = 113;
      
      public static const const_1761:int = 114;
      
      public static const const_1767:int = 115;
      
      public static const const_1644:int = 116;
      
      public static const const_1786:int = 117;
      
      public static const const_1653:int = 118;
      
      public static const const_1689:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1375:
            case const_1349:
               return "banned";
            case const_1437:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
