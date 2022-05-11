// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_replace_value(_arr, _oldVal, _newVal){
	var _indexToReplaceAt = array_find_index(_arr,_oldVal);
	if(_indexToReplaceAt == -1){
		return -1;	
	}
	_arr[@ _indexToReplaceAt] = _newVal;
	return _indexToReplaceAt;
}
