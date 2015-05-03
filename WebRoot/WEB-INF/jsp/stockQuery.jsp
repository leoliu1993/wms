<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>当前库存查询</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/icon.css" />
	<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/common2.css" />
	<script type="text/javascript" src="js/commons.js"></script>
	<script type="text/javascript">
		$(function(){
			
			//添加修改标志
			var flag = '';
			//搜索框展开标志
			var searchStatus = 0;
			/**
			 * 表格初始化
			 */
			$('#commodityTable').datagrid({
				
				idField:'stockId',
				//ajax异步后台请求
				url: 'stockAction_getDatagrid',
				fit: true,
				//自动列间距
				fitColumns: false,
				border: false,
				//分页查询
				pagination: true,
				//加载等待提示
				loadMsg:'数据正在加载中，请耐心等待…',
				//列内容
				columns:[[
				    {
				    	title:'库存ID',
						field:'stockId',
						width:100,
						hidden: true
				    },{
						title:'商品ID',
						field:'commodityId',
						width:100,
						hidden: true
					},{
						title:'商品名称',
						field:'commodityName',
						width:100,
						sortable: false
					},{
						title:'仓库ID',
						field:'storageId',
						width:100,
						hidden: true
					},{
						title:'仓库名称',
						field:'storageName',
						width:100
					},{
						title:'入库量',
						field:'inStock',
						width:100,
					},{
						title:'出库量',
						field:'outStock',
						width:100,
					},{
						title:'可见销售量',
						field:'visibleStock',
						width:100,
					},{
						title:'库存量',
						field:'stockAmount',
						width:100,
					}
				]],
				
				
				
				
			});
			
			/**
			 * 商品编号输入框初始化
			 */
			$('#commodityNum').validatebox({
				required : true ,
				validType : 'midLength[2,5]' , 
				invalidMessage : '商品编号必须在2到5个长度之间' ,
				missingMessage : '请填写商品编号'
			});
			
			/**
			 * 表单提交按钮
			 */
			$('#saveButton').click(function(){
				if($('#addForm').form('validate')){
					$.ajax({
						type: 'post',
						url: flag=='add'? 'commodityAction_add' : 'commodityAction_update',
						cache: false,
						data: $('#addForm').serialize(),
						dataType: 'json',
						success: function(result) {
							$('#addDialog').dialog('close');
							if(result.success){
								$.messager.show ({
									title: "ok!",
									msg: result.message
								});
								$('#addForm').form('reset');
								$('#commodityTable').datagrid('reload');
							} else {
								$.messager.show ({
									title: "fail!",
									msg: result.message
								});
							}
						},
					});
				} else {
					$.messager.show({
						title: '提示信息' ,
						msg: '数据有误，不能保存！'
					});
				}
			});
			
			/**
			 * 表单取消按钮
			 */
			$('#cancelButton').click(function(){
				$('#addDialog').dialog('close');
			});
			
			/**
			 * 搜索按钮
			 */
			$('#searchButton').click(function() {
				$('#commodityTable').datagrid('load', serializeForm($('#commoditySearch')));
			});
			
			/**
			 * 清空按钮
			 */
			$('#clearButton').click(function() {
				$('#commoditySearch').form('reset');
			});
			
			/**
			 * 计量单位下拉菜单
			 */
			$('#unitCombobox').combobox({
				url:'commodityAction_getUnitList',
				editable:false,
			    valueField:'unitId',
			    textField:'unitName',
			});
			
			/**
			 * 商品类别下拉菜单
			 */
			$('#cotegoryCombobox').combobox({
				url:'cmdtCtgrAction_getCategoryList',
				editable:false,
			    valueField:'cid',
			    textField:'cname',
			});
			
		});
		
		//js方法：序列化表单 			
		function serializeForm(form) {
			var obj = {};
			$.each(form.serializeArray(), function(index) {
				if (obj[this['name']]) {
					obj[this['name']] = obj[this['name']] + ',' + this['value'];
				} else {
					obj[this['name']] = this['value'];
				}
			});
			return obj;
		}
		
	
	</script>
	
		
  </head>
  
  <body>
  	<div id="lay" class="easyui-layout" fit=true >
		<div region="center" title="当前库存查询">
			<table id="commodityTable"></table>
		</div>
	</div>
	<div id="addDialog" title="添加商品信息" modal=true class="easyui-dialog"
		closed=true style="width:550px;padding:30px;">
		<form id="addForm" method="post">
			<input type="hidden" name="commodityId" class="textbox" />
			
			<div class="fl" style="margin:10px">
				商品名称：<input name="commodityName" class="easyui-textbox" required=true missingMessage="请填写商品名称" />
			</div>
			
			<div class="fl" style="margin:10px">
				规格型号：<input name="commodityType" class="easyui-textbox" />
			</div>
			<div class="fl" style="margin:10px">
				商品类别：<input id="cotegoryCombobox" name="categoryId" />
			</div>
			<div class="fl" style="margin:10px">
				计量单位：<input id="unitCombobox" name="unitId" />
			</div>
			<div class="fl" style="margin:10px">
				普通售价：<input name="salePrice" class="easyui-textbox" />
			</div>
			<div class="fl" style="margin:10px">
				初级会员售价：<input name="vip1Price" class="easyui-textbox" />
			</div>
			<div class="fl" style="margin:10px">
				中级会员售价：<input name="vip2Price" class="easyui-textbox" />
			</div>
			<div class="fl" style="margin:10px">
				高级会员售价：<input name="vip3Price" class="easyui-textbox" />
			</div>
			<div class="clear"></div>
			<div style="margin:10px;">
				<p style="margin:5px">备注：</p>
				<p><input name="remark" class="easyui-textbox" multiline="true"
					style="width:100%;height:100px;" /></p>
			</div>
			<div style="margin:10px;text-align:center">
				<a id="saveButton" class="easyui-linkbutton" iconCls="icon-save" style="margin-right:10px">保存</a>
				<a id="cancelButton" class="easyui-linkbutton" iconCls="icon-cancel" style="margin-left:10px">取消</a>
			</div>
			
		</form>
	</div>
</body>
</html>
