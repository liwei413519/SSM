$(function() {
	$('#table').bootstrapTable({
		method : 'post',
		cache : false,
		height : 800,
		striped : false,
		pagination : true,
		pageSize : 20,
		pageNumber : 1,
		pageList : [ 10, 20, 50, 100, 200, 500 ],
		search : true,
		showColumns : true,
		showRefresh : true,
		showExport : true,
		sortOrder : "desc",
		sortName : "tMid",
		exportTypes : [ 'csv', 'txt', 'xml' ],
		search : true,
		clickToSelect : true,
		columns : [ 
		{
			title : "消息id",
			field : "tMid",
			sortable : "true",
			visible : false,
			order: "desc"
		},
		{
			title : "Index",
			align : "center",
			valign : "middle",
			formatter: "runningFormatter"
		},
		{
			field : "fromname",
			title : "消息来自",
			align : "center",
			valign : "middle",
		},
		{
			field : "tMhead",
			title : "标题",
			align : "center",
			valign : "middle",
		},
		{
			field : "tMbody",
			title : "消息体",
			align : "center",
			valign : "middle",
		},
		{
			field : "tMdate",
			title : "消息日期",
			align : "center",
			valign : "middle",
			sortable : true,
		},
		{	
			field : "downloadresume",
			formatter:"downloadresumeformat",
			title : "简历下载",
			align : "center",
			valign : "middle",
		}
		],
		onPageChange : function(size, number) {
			
		},
		formatNoMatches : function() {
			return '无符合条件的记录';
		}
	});
	$(window).resize(function() {
		$('#table').bootstrapTable('resetView');
	});
});
function runningFormatter(value, row, index) {
    return index+1;
}
function downloadresumeformat(value,row,inde){
	var v="<a href="+value+">"+"简历"+"</a>";
	return v;
}