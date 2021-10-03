package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_2711:int;
      
      private var var_317:RoomEventViewCtrl;
      
      private var var_234:Timer;
      
      private var var_163:RoomSettingsCtrl;
      
      private var var_233:RoomThumbnailCtrl;
      
      private var var_1171:TagRenderer;
      
      private var var_278:IWindowContainer;
      
      private var var_372:IWindowContainer;
      
      private var var_681:IWindowContainer;
      
      private var var_2166:IWindowContainer;
      
      private var var_2171:IWindowContainer;
      
      private var var_1293:IWindowContainer;
      
      private var var_864:ITextWindow;
      
      private var var_1033:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_846:ITextWindow;
      
      private var var_1290:ITextWindow;
      
      private var var_1034:ITextWindow;
      
      private var var_844:ITextWindow;
      
      private var var_1584:ITextWindow;
      
      private var var_232:IWindowContainer;
      
      private var var_847:IWindowContainer;
      
      private var var_1588:IWindowContainer;
      
      private var var_2170:ITextWindow;
      
      private var var_682:ITextWindow;
      
      private var var_2169:IWindow;
      
      private var var_1291:IContainerButtonWindow;
      
      private var var_1292:IContainerButtonWindow;
      
      private var var_1289:IContainerButtonWindow;
      
      private var var_1288:IContainerButtonWindow;
      
      private var var_1287:IContainerButtonWindow;
      
      private var var_1285:IContainerButtonWindow;
      
      private var var_1587:IButtonWindow;
      
      private var var_1586:IButtonWindow;
      
      private var var_1585:IButtonWindow;
      
      private var var_845:IWindowContainer;
      
      private var var_1286:ITextWindow;
      
      private var var_1036:ITextFieldWindow;
      
      private var var_63:IWindowContainer;
      
      private var var_1035:IButtonWindow;
      
      private var var_848:IButtonWindow;
      
      private var var_2168:String;
      
      private var var_2167:String;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_317 = new RoomEventViewCtrl(this._navigator);
         this.var_163 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_233 = new RoomThumbnailCtrl(this._navigator);
         this.var_1171 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_163);
         this.var_234 = new Timer(6000,1);
         this.var_234.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.removeEventListener(HabboToolbarSetIconEvent.const_97,this.onToolbarIconState);
         }
         if(this.var_234)
         {
            this.var_234.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_234.reset();
            this.var_234 = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_234.reset();
         this.var_317.active = true;
         this.var_163.active = false;
         this.var_233.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_234.reset();
         this.var_163.load(param1);
         this.var_163.active = true;
         this.var_317.active = false;
         this.var_233.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_163.active = true;
         this.var_317.active = false;
         this.var_233.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_234.reset();
         this.var_163.active = false;
         this.var_317.active = false;
         this.var_233.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1149,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_234.reset();
         this.var_317.active = false;
         this.var_163.active = false;
         this.var_233.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_47,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_234.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_234.reset();
         this.var_317.active = false;
         this.var_163.active = false;
         this.var_233.active = false;
         this.refresh();
         if(!this._window.visible)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_47,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            this._window.parent.activate();
         }
         else
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_453,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info","buttons_container"],0,2);
         this._window.height = Util.getLowestPoint(this._window);
         this._window.y = this._window.desktop.height - this._window.height - 5;
         Logger.log("MAIN: " + this.var_278.rectangle + ", " + this.var_232.rectangle + ", " + this._window.rectangle);
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_278);
         this.var_278.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_163.refresh(this.var_278);
         this.var_233.refresh(this.var_278);
         Util.moveChildrenToColumn(this.var_278,["room_details","room_buttons"],0,2);
         this.var_278.height = Util.getLowestPoint(this.var_278);
         this.var_278.visible = true;
         Logger.log("XORP: " + this.var_372.visible + ", " + this.var_1293.visible + ", " + this.var_681.visible + ", " + this.var_681.rectangle + ", " + this.var_278.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_232);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_317.refresh(this.var_232);
         if(Util.hasVisibleChildren(this.var_232) && !(this.var_163.active || this.var_233.active))
         {
            Util.moveChildrenToColumn(this.var_232,["event_details","event_buttons"],0,2);
            this.var_232.height = Util.getLowestPoint(this.var_232);
            this.var_232.visible = true;
         }
         else
         {
            this.var_232.visible = false;
         }
         Logger.log("EVENT: " + this.var_232.visible + ", " + this.var_232.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_163.active && !this.var_233.active && !this.var_317.active)
         {
            this.var_845.visible = true;
            this.var_1036.text = this.getEmbedData();
         }
         else
         {
            this.var_845.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this.var_63)
         {
            return;
         }
         if(this.var_163.active)
         {
            this.var_63.visible = false;
            return;
         }
         this.var_63.visible = true;
         if(this.var_1035)
         {
            if(this.var_2168 == "exit_homeroom")
            {
               this.var_1035.caption = "${navigator.homeroom}";
            }
            else
            {
               this.var_1035.caption = "${navigator.hotelview}";
            }
         }
         if(this.var_848)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_848.visible = _loc1_;
            if(this.var_2167 == "0")
            {
               this.var_848.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_848.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_163.active || this.var_233.active)
         {
            return;
         }
         this.var_864.text = param1.roomName;
         this.var_864.height = this.var_864.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_846.text = param1.description;
         this.var_1171.refreshTags(this.var_372,param1.tags);
         this.var_846.visible = false;
         if(param1.description != "")
         {
            this.var_846.height = this.var_846.textHeight + 5;
            this.var_846.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1292,"facebook_logo_small",_loc3_,null,0);
         this.var_1292.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1291,"thumb_up",_loc4_,null,0);
         this.var_1291.visible = _loc4_;
         this.var_844.visible = !_loc4_;
         this.var_1584.visible = !_loc4_;
         this.var_1584.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_372,"home",param2,null,0);
         this._navigator.refreshButton(this.var_372,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_372,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_864.y,0);
         this.var_372.visible = true;
         this.var_372.height = Util.getLowestPoint(this.var_372);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_372.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_163.active || this.var_233.active)
         {
            return;
         }
         this.var_1033.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1033.height = this.var_1033.textHeight + 5;
         this.var_1290.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1290.height = this.var_1290.textHeight + 5;
         Util.moveChildrenToColumn(this.var_681,["public_space_name","public_space_desc"],this.var_1033.y,0);
         this.var_681.visible = true;
         this.var_681.height = Math.max(86,Util.getLowestPoint(this.var_681));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_317.active)
         {
            return;
         }
         this.var_2170.text = param1.eventName;
         this.var_682.text = param1.eventDescription;
         this.var_1171.refreshTags(this.var_847,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_682.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_682.height = this.var_682.textHeight + 5;
            this.var_682.y = Util.getLowestPoint(this.var_847) + 2;
            this.var_682.visible = true;
         }
         this.var_847.visible = true;
         this.var_847.height = Util.getLowestPoint(this.var_847);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_163.active || this.var_233.active)
         {
            return;
         }
         this.var_1587.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1289.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1288.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1287.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1285.visible = this._navigator.data.canEditRoomSettings && param1;
         this.var_1293.visible = Util.hasVisibleChildren(this.var_1293);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_317.active)
         {
            return;
         }
         this.var_1586.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1585.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1588.visible = Util.hasVisibleChildren(this.var_1588);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
         this._window.setParamFlag(HabboWindowParam.const_58,false);
         this._window.setParamFlag(HabboWindowParam.const_1346,true);
         this._window.visible = false;
         this.var_278 = IWindowContainer(this.find("room_info"));
         this.var_372 = IWindowContainer(this.find("room_details"));
         this.var_681 = IWindowContainer(this.find("public_space_details"));
         this.var_2166 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2171 = IWindowContainer(this.find("rating_cont"));
         this.var_1293 = IWindowContainer(this.find("room_buttons"));
         this.var_864 = ITextWindow(this.find("room_name"));
         this.var_1033 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_846 = ITextWindow(this.find("room_desc"));
         this.var_1290 = ITextWindow(this.find("public_space_desc"));
         this.var_1034 = ITextWindow(this.find("owner_caption"));
         this.var_844 = ITextWindow(this.find("rating_caption"));
         this.var_1584 = ITextWindow(this.find("rating_txt"));
         this.var_232 = IWindowContainer(this.find("event_info"));
         this.var_847 = IWindowContainer(this.find("event_details"));
         this.var_1588 = IWindowContainer(this.find("event_buttons"));
         this.var_2170 = ITextWindow(this.find("event_name"));
         this.var_682 = ITextWindow(this.find("event_desc"));
         this.var_1292 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1291 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2169 = this.find("staff_pick_button");
         this.var_1289 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1288 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1287 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1285 = IContainerButtonWindow(this.find("unmake_home_button"));
         this.var_1587 = IButtonWindow(this.find("room_settings_button"));
         this.var_1586 = IButtonWindow(this.find("create_event_button"));
         this.var_1585 = IButtonWindow(this.find("edit_event_button"));
         this.var_845 = IWindowContainer(this.find("embed_info"));
         this.var_1286 = ITextWindow(this.find("embed_info_txt"));
         this.var_1036 = ITextFieldWindow(this.find("embed_src_txt"));
         this.var_63 = IWindowContainer(this.find("buttons_container"));
         this.var_1035 = IButtonWindow(this.find("exit_room_button"));
         this.var_848 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1289,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1288,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1587,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1287,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1285,this.onUnmakeHomeClick);
         Util.setProcDirectly(this.var_1586,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1585,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1036,this.onEmbedSrcClick);
         Util.setProcDirectly(this.var_1291,this.onThumbUp);
         Util.setProcDirectly(this.var_2169,this.onStaffPick);
         Util.setProcDirectly(this.var_1292,this.onFacebookLike);
         Util.setProcDirectly(this.var_848,this.onZoomClick);
         Util.setProcDirectly(this.var_1035,this.method_9);
         this._navigator.refreshButton(this.var_1289,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1288,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1287,"home",true,null,0);
         this._navigator.refreshButton(this.var_1285,"home",true,null,0);
         this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         Util.setProcDirectly(this.var_278,this.onHover);
         Util.setProcDirectly(this.var_232,this.onHover);
         this.var_1034.width = this.var_1034.textWidth;
         Util.moveChildrenToRow(this.var_2166,["owner_caption","owner_name"],this.var_1034.x,this.var_1034.y,3);
         this.var_844.width = this.var_844.textWidth;
         Util.moveChildrenToRow(this.var_2171,["rating_caption","rating_txt"],this.var_844.x,this.var_844.y,3);
         this.var_1286.height = this.var_1286.textHeight + 5;
         Util.moveChildrenToColumn(this.var_845,["embed_info_txt","embed_src_txt"],this.var_1286.y,2);
         this.var_845.height = Util.getLowestPoint(this.var_845) + 5;
         this.var_2711 = this._window.y + this._window.height;
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1036.setSelection(0,this.var_1036.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_39);
         _loc3_.iconId = HabboToolbarIconEnum.ZOOM;
         _loc3_.iconName = "ZOOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function method_9(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_39);
         _loc3_.iconId = HabboToolbarIconEnum.EXITROOM;
         _loc3_.iconName = "EXITROOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onToolbarIconState(param1:HabboToolbarSetIconEvent) : void
      {
         if(param1.type != HabboToolbarSetIconEvent.const_97)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.ZOOM:
               this.var_2167 = param1.iconState;
               this.refreshButtons();
               break;
            case HabboToolbarIconEnum.EXITROOM:
               this.var_2168 = param1.iconState;
               this.refreshButtons();
         }
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_234.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_453,HabboToolbarIconEnum.ROOMINFO,this._window,false));
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      public function registerToolbarEvents() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.addEventListener(HabboToolbarSetIconEvent.const_97,this.onToolbarIconState);
         }
      }
   }
}
