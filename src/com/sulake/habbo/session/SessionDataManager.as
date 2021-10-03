package com.sulake.habbo.session
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.availability.AvailabilityStatusMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.purse.CreditBalanceEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.pets.PetRespectFailedEvent;
   import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.RespectPetMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.RespectUserMessageComposer;
   import com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.purse.CreditBalanceParser;
   import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.session.events.SessionCreditBalanceEvent;
   import com.sulake.habbo.session.furniture.FurnitureDataParser;
   import com.sulake.habbo.session.furniture.IFurniDataListener;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.session.product.IProductDataListener;
   import com.sulake.habbo.session.product.ProductDataParser;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class SessionDataManager extends Component implements ISessionDataManager
   {
       
      
      private var _communication:IHabboCommunicationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_17:IRoomSessionManager;
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_620:String;
      
      private var var_938:String;
      
      private var var_1699:String;
      
      private var var_2142:int = 0;
      
      private var _respectLeft:int = 0;
      
      private var var_670:int = 0;
      
      private var var_830:Array;
      
      private var var_1535:GroupDetailsView;
      
      private var var_2115:Boolean;
      
      private var var_2114:Boolean;
      
      private var var_1152:Dictionary;
      
      private var var_542:ProductDataParser;
      
      private var var_441:Map;
      
      private var _wallItems:Map;
      
      private var var_442:Map;
      
      private var var_273:FurnitureDataParser;
      
      private var var_1537:UserTagManager;
      
      private var var_1258:BadgeImageManager;
      
      private var var_1007:HabboGroupInfoManager;
      
      private var var_832:IgnoredUsersManager;
      
      private var var_166:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_1536:Boolean = false;
      
      private var var_1006:Array;
      
      private var var_831:Array;
      
      public function SessionDataManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this.var_830 = [];
         this.var_1537 = new UserTagManager(events);
         this.var_1007 = new HabboGroupInfoManager(this,events);
         this.var_832 = new IgnoredUsersManager(this);
         this.var_1152 = new Dictionary();
         this.var_1006 = [];
         this.var_831 = [];
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),this.onHabboCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      override public function dispose() : void
      {
         if(this.var_441)
         {
            this.var_441.dispose();
            this.var_441 = null;
         }
         if(this.var_442)
         {
            this.var_442.dispose();
            this.var_442 = null;
         }
         if(this._communication)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_17)
         {
            this.var_17.release(new IIDHabboRoomSessionManager());
            this.var_17 = null;
         }
         if(this.var_166)
         {
            this.var_166.release(new IIDHabboConfigurationManager());
            this.var_166 = null;
         }
         if(this._localization)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         this.var_831 = null;
         if(this.var_273)
         {
            this.var_273.removeEventListener(FurnitureDataParser.const_102,this.onFurnitureReady);
            this.var_273.dispose();
            this.var_273 = null;
         }
         if(this.var_542)
         {
            this.var_542.removeEventListener(ProductDataParser.const_102,this.onProductsReady);
            this.var_542.dispose();
            this.var_542 = null;
         }
         super.dispose();
      }
      
      private function initBadgeImageManager() : void
      {
         if(this.var_1258 != null)
         {
            return;
         }
         if(this.var_166 == null || this._localization == null)
         {
            return;
         }
         this.var_1258 = new BadgeImageManager(context.root.assets,events,this.var_166,this._localization);
      }
      
      private function onWindowManagerReady(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onHabboCommunicationReady(param1:IID, param2:IUnknown) : void
      {
         this._communication = param2 as IHabboCommunicationManager;
         if(this._communication == null)
         {
            return;
         }
         this._communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this.onUserRights));
         this._communication.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObject));
         this._communication.addHabboConnectionMessageEvent(new UserChangeMessageEvent(this.onUserChange));
         this._communication.addHabboConnectionMessageEvent(new UserNameChangedMessageEvent(this.onUserNameChange));
         this._communication.addHabboConnectionMessageEvent(new AvailabilityStatusMessageEvent(this.onAvailabilityStatus));
         this._communication.addHabboConnectionMessageEvent(new CreditBalanceEvent(this.onCreditBalance));
         this._communication.addHabboConnectionMessageEvent(new PetRespectFailedEvent(this.onPetRespectFailed));
         this.var_1537.communication = this._communication;
         this.var_1007.communication = this._communication;
         this.var_832.registerMessageEvents();
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         var _loc3_:* = null;
         if(param2 == null)
         {
            return;
         }
         this.var_166 = param2 as IHabboConfigurationManager;
         this.initBadgeImageManager();
         if(!this.var_273)
         {
            this.var_441 = new Map();
            this._wallItems = new Map();
            this.var_442 = new Map();
            this.var_273 = new FurnitureDataParser(this.var_441,this._wallItems,this.var_442,this._localization);
            this.var_273.addEventListener(FurnitureDataParser.const_102,this.onFurnitureReady);
            if(this.var_166.keyExists("furnidata.load.url"))
            {
               _loc3_ = this.var_166.getKey("furnidata.load.url");
               this.var_273.loadData(_loc3_);
            }
         }
      }
      
      private function onLocalizationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         this._localization = param2 as IHabboLocalizationManager;
         this.initBadgeImageManager();
         if(this.var_273)
         {
            this.var_273.localization = this._localization;
            this.var_273.registerFurnitureLocalizations();
         }
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_17 = param2 as IRoomSessionManager;
      }
      
      private function onFurnitureReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         this.var_273.removeEventListener(FurnitureDataParser.const_102,this.onFurnitureReady);
         for each(_loc2_ in this.var_831)
         {
            _loc2_.furniDataReady();
         }
         this.var_831 = [];
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:UserRightsMessageEvent = param1 as UserRightsMessageEvent;
         this.var_830 = _loc2_.rights;
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectEvent = param1 as UserObjectEvent;
         var _loc3_:UserObjectMessageParser = _loc2_.getParser();
         this._id = _loc3_.id;
         this._name = _loc3_.name;
         this.var_2142 = _loc3_.respectTotal;
         this._respectLeft = _loc3_.respectLeft;
         this.var_670 = _loc3_.petRespectLeft;
         this.var_620 = _loc3_.figure;
         this.var_938 = _loc3_.sex;
         this.var_1699 = _loc3_.realName;
         this.var_832.initIgnoreList();
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserChangeMessageEvent = param1 as UserChangeMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.id == -1)
         {
            this.var_620 = _loc2_.figure;
            this.var_938 = _loc2_.sex;
            events.dispatchEvent(new HabboSessionFigureUpdatedEvent(this._id,this.var_620,this.var_938));
         }
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserNameChangedMessageEvent = param1 as UserNameChangedMessageEvent;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:UserNameChangedMessageParser = _loc2_.getParser();
         if(_loc3_.webId == this._id)
         {
            this._name = _loc3_.newName;
         }
      }
      
      private function onAvailabilityStatus(param1:IMessageEvent) : void
      {
         var _loc2_:AvailabilityStatusMessageParser = (param1 as AvailabilityStatusMessageEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_2115 = _loc2_.isOpen;
         this.var_2114 = _loc2_.onShutDown;
      }
      
      private function onCreditBalance(param1:CreditBalanceEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:CreditBalanceParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         if(events != null)
         {
            events.dispatchEvent(new SessionCreditBalanceEvent(_loc2_.balance));
         }
      }
      
      private function onPetRespectFailed(param1:PetRespectFailedEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         ++this.var_670;
      }
      
      public function get systemOpen() : Boolean
      {
         return this.var_2115;
      }
      
      public function get systemShutDown() : Boolean
      {
         return this.var_2114;
      }
      
      public function hasUserRight(param1:String) : Boolean
      {
         if(this.var_830 == null)
         {
            return false;
         }
         return this.var_830.indexOf(param1) >= 0;
      }
      
      public function get userId() : int
      {
         return this._id;
      }
      
      public function get userName() : String
      {
         return this._name;
      }
      
      public function get realName() : String
      {
         return this.var_1699;
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         if(this.var_830 == null)
         {
            return false;
         }
         return this.var_830.indexOf("fuse_any_room_controller") >= 0;
      }
      
      public function getUserTags(param1:int) : Array
      {
         return this.var_1537.getTags(param1);
      }
      
      public function getBadgeImage(param1:String) : BitmapData
      {
         return this.var_1258.getBadgeImage(param1);
      }
      
      public function showGroupBadgeInfo(param1:int) : void
      {
         if(this.var_1535 == null)
         {
            this.var_1535 = new GroupDetailsView(this);
         }
         var _loc2_:HabboGroupDetails = this.var_1007.getGroupDetails(param1);
         if(_loc2_ != null)
         {
            this.var_1535.showGroupDetails(param1);
         }
      }
      
      public function getGroupDetails(param1:int) : HabboGroupDetails
      {
         return this.var_1007.getGroupDetails(param1);
      }
      
      public function getGroupBadgeId(param1:int) : String
      {
         return this.var_1007.getBadgeId(param1);
      }
      
      public function getGroupBadgeImage(param1:String) : BitmapData
      {
         return this.var_1258.getBadgeImage(param1,BadgeImageManager.const_1146);
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return this._communication;
      }
      
      public function isIgnored(param1:String) : Boolean
      {
         return this.var_832.isIgnored(param1);
      }
      
      public function ignoreUser(param1:String) : void
      {
         this.var_832.ignoreUser(param1);
      }
      
      public function unignoreUser(param1:String) : void
      {
         this.var_832.unignoreUser(param1);
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_670;
      }
      
      public function giveRespect(param1:int) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(null);
         if(param1 < 0 || this._respectLeft < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to user: " + param1);
         }
         _loc2_.send(new RespectUserMessageComposer(param1));
         this._respectLeft = this._respectLeft - 1;
      }
      
      public function givePetRespect(param1:int) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(null);
         if(param1 < 0 || this.var_670 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to pet: " + param1);
         }
         _loc2_.send(new RespectPetMessageComposer(param1));
         this.var_670 = this.var_670 - 1;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_166;
      }
      
      public function getProductData(param1:String) : IProductData
      {
         if(!this.var_1536)
         {
            this.loadProductData();
         }
         return this.var_1152[param1];
      }
      
      public function getFloorItemData(param1:int) : IFurnitureData
      {
         if(this.var_441 == null)
         {
            return null;
         }
         return this.var_441.getValue(param1.toString());
      }
      
      public function method_4(param1:int) : IFurnitureData
      {
         if(this._wallItems == null)
         {
            return null;
         }
         return this._wallItems.getValue(param1.toString());
      }
      
      public function getFloorItemDataByName(param1:String) : IFurnitureData
      {
         if(this.var_442 == null)
         {
            return null;
         }
         return this.getFloorItemData(parseInt(this.var_442.getValue(param1)));
      }
      
      public function getWallItemDataByName(param1:String) : IFurnitureData
      {
         if(this.var_442 == null)
         {
            return null;
         }
         return this.method_4(parseInt(this.var_442.getValue(param1)));
      }
      
      public function openHabboHomePage(param1:int) : void
      {
         var urlString:String = null;
         var userId:int = param1;
         if(this.var_166 != null)
         {
            urlString = this.var_166.getKey("link.format.userpage");
            urlString = urlString.replace("%ID%",String(userId));
            try
            {
               HabboWebTools.navigateToURL(urlString,"habboMain");
            }
            catch(e:Error)
            {
               Logger.log("Error occurred!");
            }
         }
      }
      
      public function pickAllFurniture(param1:int, param2:int) : void
      {
         var roomId:int = param1;
         var roomCategory:int = param2;
         if(this.var_17 == null || this._windowManager == null)
         {
            return;
         }
         var session:IRoomSession = this.var_17.getSession(roomId,roomCategory);
         if(session == null)
         {
            return;
         }
         if(session.isRoomOwner || this.isAnyRoomController)
         {
            this._windowManager.confirm("${generic.alert.title}","${room.confirm.pick_all}",0,function(param1:IConfirmDialog, param2:Event):void
            {
               param1.dispose();
               if(param2.type == WindowEvent.const_174)
               {
                  sendPickAllFurnitureMessage();
               }
            });
         }
      }
      
      public function loadProductData(param1:IProductDataListener = null) : Boolean
      {
         var _loc2_:* = null;
         if(this.var_1536)
         {
            return true;
         }
         if(this.var_1006.indexOf(param1) == -1)
         {
            this.var_1006.push(param1);
         }
         if(this.var_542 == null)
         {
            _loc2_ = this.var_166.getKey("productdata.load.url");
            this.var_542 = new ProductDataParser(_loc2_,this.var_1152);
            this.var_542.addEventListener(ProductDataParser.const_102,this.onProductsReady);
         }
         return false;
      }
      
      private function onProductsReady(param1:Event) : void
      {
         var _loc2_:* = null;
         this.var_542.removeEventListener(ProductDataParser.const_102,this.onProductsReady);
         this.var_1536 = true;
         for each(_loc2_ in this.var_1006)
         {
            if(_loc2_ != null && !_loc2_.disposed)
            {
               _loc2_.productDataReady();
            }
         }
         this.var_1006 = [];
      }
      
      private function sendPickAllFurnitureMessage() : void
      {
         var _loc1_:IConnection = this._communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new ChatMessageComposer(":pickall"));
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return this.var_17;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get gender() : String
      {
         return this.var_938;
      }
      
      public function getFurniData(param1:IFurniDataListener) : Array
      {
         if(this.var_441.length == 0)
         {
            if(this.var_831.indexOf(param1) == -1)
            {
               this.var_831.push(param1);
            }
            return null;
         }
         var _loc2_:Array = this.var_441.getValues();
         return _loc2_.concat(this._wallItems.getValues());
      }
   }
}
