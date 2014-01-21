/***************************************************************************

 * Product Name				: AJ MATRIX DNA

 * Version 				: V 3.1

 * Release Date				: Saturday, October 31, 2009

 * Copyright				: (C) 2009 AJ Square Inc

 * Email				: info@ajsquare.com

 * Company URL				: www.ajsquare.com

 ***************************************************************************/

/****************************************************************************
* Licence Agreement: 

 *     This program is a Commercial licensed software. You are not authorized to redistribute it and/or modify/and or sell it under any publication either user and enterprise versions of the License (or) any later version is applicable for the same. If you have received this software without a license, you must not use it, and you must destroy your copy of it immediately. If anybody illegally uses this software, please contact info@ajsquare.com.

*****************************************************************************/

var TinyMCE_SimpleTheme = {
	// List of button ids in tile map
	_buttonMap : 'bold,bullist,cleanup,italic,numlist,redo,strikethrough,underline,undo',

	getEditorTemplate : function() {
		var html = '';

		html += '<table class="mceEditor" border="0" cellpadding="0" cellspacing="0" width="{$width}" height="{$height}">';
		html += '<tr><td align="center">';
		html += '<span id="{$editor_id}">IFRAME</span>';
		html += '</td></tr>';
		html += '<tr><td class="mceToolbar" align="center" height="1">';
		html += tinyMCE.getButtonHTML('bold', 'lang_bold_desc', '{$themeurl}/images/{$lang_bold_img}', 'Bold');
		html += tinyMCE.getButtonHTML('italic', 'lang_italic_desc', '{$themeurl}/images/{$lang_italic_img}', 'Italic');
		html += tinyMCE.getButtonHTML('underline', 'lang_underline_desc', '{$themeurl}/images/{$lang_underline_img}', 'Underline');
		html += tinyMCE.getButtonHTML('strikethrough', 'lang_striketrough_desc', '{$themeurl}/images/strikethrough.gif', 'Strikethrough');
		html += '<img src="{$themeurl}/images/separator.gif" width="2" height="20" class="mceSeparatorLine" />';
		html += tinyMCE.getButtonHTML('undo', 'lang_undo_desc', '{$themeurl}/images/undo.gif', 'Undo');
		html += tinyMCE.getButtonHTML('redo', 'lang_redo_desc', '{$themeurl}/images/redo.gif', 'Redo');
		html += '<img src="{$themeurl}/images/separator.gif" width="2" height="20" class="mceSeparatorLine" />';
		html += tinyMCE.getButtonHTML('cleanup', 'lang_cleanup_desc', '{$themeurl}/images/cleanup.gif', 'mceCleanup');
		html += '<img src="{$themeurl}/images/separator.gif" width="2" height="20" class="mceSeparatorLine" />';
		html += tinyMCE.getButtonHTML('bullist', 'lang_bullist_desc', '{$themeurl}/images/bullist.gif', 'InsertUnorderedList');
		html += tinyMCE.getButtonHTML('numlist', 'lang_numlist_desc', '{$themeurl}/images/numlist.gif', 'InsertOrderedList');
		html += '</td></tr></table>';

		return {
			delta_width : 0,
			delta_height : 20,
			html : html
		};
	},

	handleNodeChange : function(editor_id, node) {
		// Reset old states
		tinyMCE.switchClass(editor_id + '_bold', 'mceButtonNormal');
		tinyMCE.switchClass(editor_id + '_italic', 'mceButtonNormal');
		tinyMCE.switchClass(editor_id + '_underline', 'mceButtonNormal');
		tinyMCE.switchClass(editor_id + '_strikethrough', 'mceButtonNormal');
		tinyMCE.switchClass(editor_id + '_bullist', 'mceButtonNormal');
		tinyMCE.switchClass(editor_id + '_numlist', 'mceButtonNormal');

		// Handle elements
		do {
			switch (node.nodeName.toLowerCase()) {
				case "b":
				case "strong":
					tinyMCE.switchClass(editor_id + '_bold', 'mceButtonSelected');
				break;

				case "i":
				case "em":
					tinyMCE.switchClass(editor_id + '_italic', 'mceButtonSelected');
				break;

				case "u":
					tinyMCE.switchClass(editor_id + '_underline', 'mceButtonSelected');
				break;

				case "strike":
					tinyMCE.switchClass(editor_id + '_strikethrough', 'mceButtonSelected');
				break;
				
				case "ul":
					tinyMCE.switchClass(editor_id + '_bullist', 'mceButtonSelected');
				break;

				case "ol":
					tinyMCE.switchClass(editor_id + '_numlist', 'mceButtonSelected');
				break;
			}
		} while ((node = node.parentNode) != null);
	}
};

tinyMCE.addTheme("simple", TinyMCE_SimpleTheme);
tinyMCE.addButtonMap(TinyMCE_SimpleTheme._buttonMap);
