package com.sulake.habbo.communication
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.connection.IConnectionStateListener;
   import com.sulake.core.communication.enum.ConnectionType;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.communication.enum.HabboConnectionType;
   import com.sulake.habbo.communication.enum.HabboProtocolType;
   import com.sulake.habbo.communication.messages.outgoing.handshake.DisconnectMessageComposer;
   import com.sulake.habbo.communication.protocol.WedgieProtocol;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.tracking.HabboErrorVariableEnum;
   import com.sulake.iid.IIDCoreCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, IConnectionStateListener
   {
       
      
      private const const_1911:int = 2;
      
      private var var_291:ICoreCommunicationManager;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_629:int = 0;
      
      private var var_1312:IMessageConfiguration;
      
      private var var_34:String = "";
      
      private var var_254:Array;
      
      private var var_406:int = -1;
      
      private var var_1416:Timer;
      
      private var var_928:int = 1;
      
      private var var_127:String = "";
      
      private var var_2591:Boolean = false;
      
      private var var_2592:Boolean = false;
      
      private var var_2593:Boolean = false;
      
      public function HabboCommunicationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1312 = new HabboMessages();
         this.var_254 = [];
         this.var_1416 = new Timer(100,1);
         super(param1,param2,param3);
         this.queueInterface(new IIDCoreCommunicationManager(),this.onCoreCommunicationManagerInit);
         this.queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationInit);
         param1.events.addEventListener(Event.UNLOAD,this.unloading);
      }
      
      public function get mode() : int
      {
         return this.var_629;
      }
      
      public function set mode(param1:int) : void
      {
         this.var_629 = param1;
      }
      
      public function get port() : int
      {
         if(this.var_254.length == 0 || this.var_406 < 0 || this.var_406 >= this.var_254.length)
         {
            return 0;
         }
         return this.var_254[this.var_406];
      }
      
      private function unloading(param1:Event) : void
      {
         if(this._connection)
         {
            this._connection.send(new DisconnectMessageComposer());
            this._connection.dispose();
            this._connection = null;
         }
      }
      
      override public function dispose() : void
      {
         if(this._connection)
         {
            this._connection.dispose();
            this._connection = null;
         }
         if(this.var_291)
         {
            this.var_291.release(new IIDCoreCommunicationManager());
            this.var_291 = null;
         }
         if(this._habboConfiguration)
         {
            this._habboConfiguration.release(new IIDHabboConfigurationManager());
            this._habboConfiguration = null;
         }
         super.dispose();
      }
      
      private function onCoreCommunicationManagerInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         Logger.log("Habbo Communication Manager: Core Communication Manager found:: " + [param1,param2]);
         if(param2 != null)
         {
            this.var_291 = param2 as ICoreCommunicationManager;
            this.var_291.connectionStateListener = this;
            this.var_291.registerProtocolType(HabboProtocolType.const_1108,WedgieProtocol);
            this._connection = this.var_291.createConnection(HabboConnectionType.const_211,ConnectionType.const_1041);
            _loc3_ = this.var_291.getProtocolInstanceOfType(HabboProtocolType.const_1108);
            this._connection.registerMessageClasses(this.var_1312);
            this._connection.protocol = _loc3_;
            this._connection.addEventListener(IOErrorEvent.IO_ERROR,this.method_8);
            this._connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
            this._connection.addEventListener(Event.CONNECT,this.onConnect);
         }
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param2 != null)
         {
            Logger.log("Habbo Communication Manager: init based on configuration: " + this._habboConfiguration);
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Received");
            this._habboConfiguration = param2 as IHabboConfigurationManager;
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Ready");
            this.var_254 = [];
            this.var_34 = this._habboConfiguration.getKey("connection.info.host",null);
            if(this.var_34 == null)
            {
               Core.crash("connection.info.host was not defined",Core.const_276);
               return;
            }
            _loc3_ = this._habboConfiguration.getKey("connection.info.port",null);
            if(_loc3_ == null)
            {
               Core.crash("connection.info.port was not defined",Core.const_276);
               return;
            }
            if(this._habboConfiguration.keyExists("local.environment"))
            {
               this.var_34 = this._habboConfiguration.getKey("connection.info.host.local");
               _loc3_ = this._habboConfiguration.getKey("connection.info.port.local");
            }
            _loc4_ = this.validateHost();
            if(!_loc4_)
            {
               Core.crash("Tried to connect to an invalid host: " + this.var_34,Core.const_276);
               return;
            }
            _loc5_ = _loc3_.split(",");
            for each(_loc6_ in _loc5_)
            {
               this.var_254.push(parseInt(_loc6_.replace(" ","")));
            }
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Host: " + this.var_34);
            Logger.log("Connection Host: " + this.var_34);
            Logger.log("Connection Ports: " + this.var_254);
            Logger.log("Habbo Connection Info:" + this._connection);
            this.var_2592 = true;
            if(this.var_2593)
            {
               this.nextPort();
            }
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config NOT received");
         }
      }
      
      private function validateHost() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:Array = this.var_34.split(".");
         if(_loc1_.length >= 2)
         {
            _loc2_ = _loc1_.length - 1;
            if(_loc1_[_loc2_] == "com" && (_loc1_[_loc2_ - 1] == "habbo" || _loc1_[_loc2_ - 1] == "sulake"))
            {
               return true;
            }
            if(_loc1_[_loc2_] == "net" && _loc1_[_loc2_ - 1] == "varoke")
            {
               return true;
            }
         }
         return false;
      }
      
      public function initConnection(param1:String) : void
      {
         switch(param1)
         {
            case HabboConnectionType.const_211:
               if(this._habboConfiguration == null)
               {
                  Core.crash("Tried to connect to proxy but configuration was null",Core.const_276);
                  return;
               }
               if(this._connection == null)
               {
                  Core.crash("Tried to connect to proxy but connection was null",Core.const_276);
                  return;
               }
               this.var_2593 = true;
               if(this.var_2592)
               {
                  this.nextPort();
               }
               break;
            default:
               Logger.log("Unknown Habbo Connection Type: " + param1);
         }
      }
      
      private function nextPort() : void
      {
         var _loc1_:int = 0;
         if(this._connection.connected)
         {
            Logger.log("Warning: Already connected so will not try to connect again!");
            return;
         }
         ++this.var_406;
         if(this.var_406 >= this.var_254.length)
         {
            ErrorReportStorage.addDebugData("ConnectionRetry","Connection attempt " + this.var_928);
            ++this.var_928;
            _loc1_ = this.const_1911;
            if(this.var_254.length == 1)
            {
               _loc1_++;
            }
            if(this.var_928 > _loc1_)
            {
               if(this.var_2591)
               {
                  return;
               }
               this.var_2591 = true;
               Core.error("Connection failed to host " + this.var_34 + " ports " + this.var_254,true,Core.const_276);
               return;
            }
            this.var_406 = 0;
         }
         this._connection.timeout = this.var_928 * 10000;
         this._connection.init(this.var_34,this.var_254[this.var_406]);
      }
      
      private function method_8(param1:IOErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] IO Error: " + param1.text);
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         ErrorReportStorage.addDebugData("Communication IO Error","IOError " + param1.type + " on connect: " + param1.text + ". Port was " + this.var_254[this.var_406]);
         this.tryNextPort();
      }
      
      private function onConnect(param1:Event) : void
      {
         ErrorReportStorage.addDebugData("Connection","Connected with " + this.var_928 + " attempts");
      }
      
      private function tryNextPort() : void
      {
         this.var_1416.addEventListener(TimerEvent.TIMER,this.onTryNextPort);
         this.var_1416.start();
      }
      
      private function onTryNextPort(param1:TimerEvent) : void
      {
         this.var_1416.stop();
         this.nextPort();
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("Communication Security Error","SecurityError on connect: " + param1.text + ". Port was " + this.var_254[this.var_406]);
         this.tryNextPort();
      }
      
      public function getHabboMainConnection(param1:Function) : IConnection
      {
         return !!this.var_291 ? this.var_291.queueConnection(HabboConnectionType.const_211,param1) : null;
      }
      
      public function addHabboConnectionMessageEvent(param1:IMessageEvent) : void
      {
         if(this.var_291)
         {
            this.var_291.addConnectionMessageEvent(HabboConnectionType.const_211,param1);
         }
      }
      
      public function habboWebLogin(param1:String, param2:String) : IHabboWebLogin
      {
         var _loc3_:String = "";
         _loc3_ = this._habboConfiguration.getKey("url.prefix",_loc3_);
         _loc3_ = _loc3_.replace("http://","");
         _loc3_ = _loc3_.replace("https://","");
         return new HabboWebLogin(param1,param2,_loc3_);
      }
      
      public function connectionInit(param1:String, param2:int) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1451,param1);
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1562,String(param2));
      }
      
      public function messageReceived(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1389,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1343,param1 + " " + param2);
         if(this.var_127.length > 0)
         {
            this.var_127 += ",R:" + param1;
         }
         else
         {
            this.var_127 = "R:" + param1;
         }
         if(this.var_127.length > 150)
         {
            this.var_127 = this.var_127.substring(this.var_127.length - 150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",this.var_127);
      }
      
      public function method_12(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1373,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1383,param1 + " " + param2);
         if(this.var_127.length > 0)
         {
            this.var_127 += ",S:" + param1;
         }
         else
         {
            this.var_127 = "S:" + param1;
         }
         if(this.var_127.length > 150)
         {
            this.var_127 = this.var_127.substring(this.var_127.length - 150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",this.var_127);
      }
   }
}
