
// 自定义的校验器
$.extend($.fn.validatebox.defaults.rules, {
	midLength : {
		validator : function(value, param) {
			return value.length >= param[0] && value.length <= param[1];
		},
		message : ''
	},
	equalLength : {
		validator : function(value, param) {
			return value.length == param[0];
		},
		message : '密码必须为4个字符!'
	}
});