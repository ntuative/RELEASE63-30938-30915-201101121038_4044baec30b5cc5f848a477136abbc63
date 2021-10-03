package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_696;
         param1["bitmap"] = const_610;
         param1["border"] = const_778;
         param1["border_notify"] = const_1307;
         param1["button"] = const_412;
         param1["button_thick"] = const_703;
         param1["button_icon"] = const_1555;
         param1["button_group_left"] = const_667;
         param1["button_group_center"] = const_697;
         param1["button_group_right"] = const_849;
         param1["canvas"] = const_714;
         param1["checkbox"] = const_757;
         param1["closebutton"] = const_1097;
         param1["container"] = const_369;
         param1["container_button"] = const_752;
         param1["display_object_wrapper"] = const_651;
         param1["dropmenu"] = const_513;
         param1["dropmenu_item"] = const_548;
         param1["frame"] = const_355;
         param1["frame_notify"] = const_1479;
         param1["header"] = const_624;
         param1["html"] = const_1129;
         param1["icon"] = const_981;
         param1["itemgrid"] = const_1023;
         param1["itemgrid_horizontal"] = const_444;
         param1["itemgrid_vertical"] = const_604;
         param1["itemlist"] = const_1147;
         param1["itemlist_horizontal"] = const_359;
         param1["itemlist_vertical"] = const_376;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1401;
         param1["menu"] = const_1500;
         param1["menu_item"] = const_1433;
         param1["submenu"] = const_1038;
         param1["minimizebox"] = const_1556;
         param1["notify"] = const_1374;
         param1["null"] = const_722;
         param1["password"] = const_731;
         param1["radiobutton"] = const_603;
         param1["region"] = const_758;
         param1["restorebox"] = const_1372;
         param1["scaler"] = const_622;
         param1["scaler_horizontal"] = const_1405;
         param1["scaler_vertical"] = const_1443;
         param1["scrollbar_horizontal"] = const_512;
         param1["scrollbar_vertical"] = const_678;
         param1["scrollbar_slider_button_up"] = const_942;
         param1["scrollbar_slider_button_down"] = const_952;
         param1["scrollbar_slider_button_left"] = const_1063;
         param1["scrollbar_slider_button_right"] = const_944;
         param1["scrollbar_slider_bar_horizontal"] = const_1040;
         param1["scrollbar_slider_bar_vertical"] = const_934;
         param1["scrollbar_slider_track_horizontal"] = const_1096;
         param1["scrollbar_slider_track_vertical"] = const_951;
         param1["scrollable_itemlist"] = const_1563;
         param1["scrollable_itemlist_vertical"] = const_423;
         param1["scrollable_itemlist_horizontal"] = const_1155;
         param1["selector"] = const_814;
         param1["selector_list"] = const_756;
         param1["submenu"] = const_1038;
         param1["tab_button"] = const_540;
         param1["tab_container_button"] = const_1026;
         param1["tab_context"] = const_378;
         param1["tab_content"] = const_1061;
         param1["tab_selector"] = const_633;
         param1["text"] = const_442;
         param1["input"] = const_799;
         param1["toolbar"] = const_1330;
         param1["tooltip"] = const_385;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
