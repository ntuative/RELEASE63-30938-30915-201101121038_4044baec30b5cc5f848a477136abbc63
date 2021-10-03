package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_178;
         param1["bound_to_parent_rect"] = const_93;
         param1["child_window"] = const_953;
         param1["embedded_controller"] = const_1039;
         param1["resize_to_accommodate_children"] = const_60;
         param1["input_event_processor"] = const_28;
         param1["internal_event_handling"] = const_649;
         param1["mouse_dragging_target"] = const_215;
         param1["mouse_dragging_trigger"] = const_348;
         param1["mouse_scaling_target"] = const_269;
         param1["mouse_scaling_trigger"] = const_446;
         param1["horizontal_mouse_scaling_trigger"] = const_203;
         param1["vertical_mouse_scaling_trigger"] = const_199;
         param1["observe_parent_input_events"] = const_941;
         param1["optimize_region_to_layout_size"] = const_484;
         param1["parent_window"] = const_1015;
         param1["relative_horizontal_scale_center"] = const_171;
         param1["relative_horizontal_scale_fixed"] = const_116;
         param1["relative_horizontal_scale_move"] = const_379;
         param1["relative_horizontal_scale_strech"] = WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRECH;
         param1["relative_scale_center"] = const_1098;
         param1["relative_scale_fixed"] = const_779;
         param1["relative_scale_move"] = const_948;
         param1["relative_scale_strech"] = const_992;
         param1["relative_vertical_scale_center"] = const_184;
         param1["relative_vertical_scale_fixed"] = const_134;
         param1["relative_vertical_scale_move"] = const_323;
         param1["relative_vertical_scale_strech"] = const_388;
         param1["on_resize_align_left"] = const_704;
         param1["on_resize_align_right"] = const_421;
         param1["on_resize_align_center"] = const_520;
         param1["on_resize_align_top"] = const_782;
         param1["on_resize_align_bottom"] = const_492;
         param1["on_resize_align_middle"] = const_482;
         param1["on_accommodate_align_left"] = const_957;
         param1["on_accommodate_align_right"] = const_436;
         param1["on_accommodate_align_center"] = const_769;
         param1["on_accommodate_align_top"] = const_1122;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_747;
         param1["route_input_events_to_parent"] = const_481;
         param1["use_parent_graphic_context"] = const_31;
         param1["draggable_with_mouse"] = const_1016;
         param1["scalable_with_mouse"] = const_945;
         param1["reflect_horizontal_resize_to_parent"] = const_458;
         param1["reflect_vertical_resize_to_parent"] = const_452;
         param1["reflect_resize_to_parent"] = const_303;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
