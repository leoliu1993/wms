/**
 * 日期格式化
 */
function dateFormatter(date){
	var y = date.getFullYear();
	var m = date.getMonth()+1;
	var d = date.getDate();
	return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
};

/**
 * 时间格式化
 */
function dateTimeFormatter(date){
	var y = date.getFullYear();
	var m = date.getMonth()+1;
	var d = date.getDate();
	var h = date.getHours();
	var min = date.getMinutes();
	var s = date.getSeconds();
	return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d)+" "+(h<10?('0'+h):h)+":"+(min<10?('0'+min):min)+":"+(s<10?('0'+s):s);
};

/**
 * 自定义的校验器
 */
$.extend($.fn.validatebox.defaults.rules, {
	username: {// 验证用户名
		validator: function (value) {
        	var str = /^[a-zA-Z][a-zA-Z0-9_]{5,15}$/;
            return str.test(value);
        },
        message: '用户名不合法（字母开头，允许6-16字节，允许字母数字下划线）'
    },
});
