package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_921:BigInteger;
      
      private var var_2125:BigInteger;
      
      private var var_1551:BigInteger;
      
      private var var_2128:BigInteger;
      
      private var var_1268:BigInteger;
      
      private var var_1552:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1268 = param1;
         this.var_1552 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1268.toString() + ",generator: " + this.var_1552.toString() + ",secret: " + param1);
         this.var_921 = new BigInteger();
         this.var_921.fromRadix(param1,param2);
         this.var_2125 = this.var_1552.modPow(this.var_921,this.var_1268);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1551 = new BigInteger();
         this.var_1551.fromRadix(param1,param2);
         this.var_2128 = this.var_1551.modPow(this.var_921,this.var_1268);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2125.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2128.toRadix(param1);
      }
   }
}
