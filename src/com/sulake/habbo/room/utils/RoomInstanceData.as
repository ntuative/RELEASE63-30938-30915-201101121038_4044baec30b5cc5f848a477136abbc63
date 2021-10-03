package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_736:TileHeightMap = null;
      
      private var var_1146:LegacyWallGeometry = null;
      
      private var var_1147:RoomCamera = null;
      
      private var var_737:SelectedRoomObjectData = null;
      
      private var var_738:SelectedRoomObjectData = null;
      
      private var var_2529:String = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1146 = new LegacyWallGeometry();
         this.var_1147 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_736;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_736 != null)
         {
            this.var_736.dispose();
         }
         this.var_736 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1146;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1147;
      }
      
      public function get worldType() : String
      {
         return this.var_2529;
      }
      
      public function set worldType(param1:String) : void
      {
         this.var_2529 = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_737;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_737 != null)
         {
            this.var_737.dispose();
         }
         this.var_737 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_738;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_738 != null)
         {
            this.var_738.dispose();
         }
         this.var_738 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_736 != null)
         {
            this.var_736.dispose();
            this.var_736 = null;
         }
         if(this.var_1146 != null)
         {
            this.var_1146.dispose();
            this.var_1146 = null;
         }
         if(this.var_1147 != null)
         {
            this.var_1147.dispose();
            this.var_1147 = null;
         }
         if(this.var_737 != null)
         {
            this.var_737.dispose();
            this.var_737 = null;
         }
         if(this.var_738 != null)
         {
            this.var_738.dispose();
            this.var_738 = null;
         }
      }
   }
}
