package com.sulake.core.assets
{
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class SoundAsset implements IAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_162:Sound = null;
      
      private var var_1464:AssetTypeDeclaration;
      
      private var var_962:String;
      
      public function SoundAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_1464 = param1;
         this.var_962 = param2;
      }
      
      public function get url() : String
      {
         return this.var_962;
      }
      
      public function get content() : Object
      {
         return this.var_162 as Object;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1464;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_162 = null;
            this.var_1464 = null;
            this.var_962 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is Sound)
         {
            if(this.var_162)
            {
               this.var_162.close();
            }
            this.var_162 = param1 as Sound;
            return;
         }
         if(param1 is ByteArray)
         {
         }
         if(param1 is Class)
         {
            if(this.var_162)
            {
               this.var_162.close();
            }
            this.var_162 = new param1() as Sound;
            return;
         }
         if(param1 is SoundAsset)
         {
            if(this.var_162)
            {
               this.var_162.close();
            }
            this.var_162 = SoundAsset(param1).var_162;
            return;
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is SoundAsset)
         {
            this.var_162 = SoundAsset(param1).var_162;
         }
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
