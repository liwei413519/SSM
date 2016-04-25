/**
 * Bootstrap Table Chinese translation
 * Author: Zhixin Wen<wenzhixin2010@gmail.com>
 */
(function ($) {
    'use strict';

    $.fn.bootstrapTable.locales['zh-CN'] = {
        formatLoadingMessage: function () {
            return '姝ｅ湪鍔姏鍦板姞杞芥暟鎹腑锛岃绋嶅€欌€︹€�';
        },
        formatRecordsPerPage: function (pageNumber) {
            return '姣忛〉鏄剧ず ' + pageNumber + ' 鏉¤褰�';
        },
        formatShowingRows: function (pageFrom, pageTo, totalRows) {
            return '鏄剧ず绗� ' + pageFrom + ' 鍒扮 ' + pageTo + ' 鏉¤褰曪紝鎬诲叡 ' + totalRows + ' 鏉¤褰�';
        },
        formatSearch: function () {
            return '鎼滅储';
        },
        formatNoMatches: function () {
            return '娌℃湁鎵惧埌鍖归厤鐨勮褰�';
        },
        formatPaginationSwitch: function () {
            return '闅愯棌/鏄剧ず鍒嗛〉';
        },
        formatRefresh: function () {
            return '鍒锋柊';
        },
        formatToggle: function () {
            return '鍒囨崲';
        },
        formatColumns: function () {
            return '鍒�';
        }
    };

    $.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);

})(jQuery);