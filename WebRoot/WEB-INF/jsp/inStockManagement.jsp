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
    
    <title>入库管理</title>
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
			$('#supplierTable').datagrid({
				
				idField:'purchaseId',
				//ajax异步后台请求
				url: 'purchaseAction_getDatagrid',
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
				    	field:'checkbox',
				    	width:50,
				    	checkbox:true
				    },{
				    	title:'进购订单ID',
						field:'purchaseId',
						width:150,
						hidden: false
				    },{
						title:'订单生成日期',
						field:'createDate',
						width:100,
						sortable: false
					},{
						title:'应付金额',
						field:'payablePrice',
						width:100
					},{
						title:'实付金额',
						field:'realPrice',
						width:100
					},{
						title:'是否付款',
						field:'state',
						width:100,
						formatter: function(value,row,index){
							if (row.state == 1){
								return '已付款';
							} else {
								return '未付款';
							}
						}

					},{
						title:'操作员姓名',
						field:'userName',
						width:100,
					},{
						title:'备注',
						field:'remark',
						width:100
					}
				]],
				
				
				//增加工具栏，添加增删改查按钮
				toolbar:[
					{
						text:'查询订单详情',
						iconCls:'icon-search',
						handler:function(){
							var arr = $('#supplierTable').datagrid('getSelections');
							if(arr.length != 1) {
								$.messager.show({
									title: '提示信息！',
									msg: '只能选择一行记录进行查询！'
								});
							} else {
								
								var ids = '';
								ids += arr[0].purchaseId;
						        $('#detailGrid').datagrid('options').url = 'purchaseAction_getDetailGrid';
						        $('#detailGrid').datagrid('load', {purchaseId:ids}); 
								
							}
							
						}
					},'-',{
						text:'确认商品入库',
						iconCls:'icon-add',
						handler:function(){
							
							var arr = $('#supplierTable').datagrid('getSelections');
							if(arr.length != 1) {
								$.messager.show({
									title: '提示信息！',
									msg: '只能选择一行记录进行修改！'
								});
							} else {
								$('#addDialog').dialog('open');
								
							}
							
						}
					},'-',{
						text:'删除供应商信息',
						iconCls:'icon-remove',
						handler:function(){
							
							var arr = $('#supplierTable').datagrid('getSelections');
							if(arr.length < 1) {
								$.messager.show({
									title: '提示信息！',
									msg: '至少选择一行记录进行修改！'
								});
							} else {
								
								$.messager.confirm('提示信息' , '删除后商品信息无法回复，是否确认删除？' , function(result){
									if(result) {
										
										var ids = '';
										for(var i=0; i<arr.length; i++) {
											ids += arr[i].supplierId + ',';
										}
										ids = ids.substring(0, ids.length-1);
										$.post('supplierAction_delete', {ids:ids}, function(result){
											if(result){
												//1.刷新数据表格
												$('#supplierTable').datagrid('reload');
												//2.给出提示信息
												$.messager.show ({
													title: 'ok!',
													msg: '商品信息删除成功！'
												});
												//3.清楚数据表格勾选
												$('#supplierTable').datagrid('clearSelections');
												$('#detailGrid').datagrid('loadData',{total:0,rows:[]});
												
											} else {
												$.messager.show ({
													title: 'fail!',
													msg: '商品信息删除失败！'
												});
											}
										});
										
									} else {
										return;
									}
								});
								
							}
							
						}						
					},'-',{
						text:'修改供应商信息',
						iconCls:'icon-edit',
						handler:function(){
							
							//标志位修改
							flag = 'edit';
							//动态设定对话框标题
							$('#addDialog').panel({
								title: '修改商品信息'
							});
							var arr = $('#supplierTable').datagrid('getSelections');
							if(arr.length != 1) {
								$.messager.show({
									title: '提示信息！',
									msg: '只能选择一行记录进行修改！'
								});
							} else {
								$('#addDialog').dialog('open');
								$('#addForm').form('reset');
								$('#addForm').form('load',{
									supplierId: arr[0].supplierId,
									supplierName: arr[0].supplierName,
									contactPeople: arr[0].contactPeople,
									contactTel: arr[0].contactTel,
									address: arr[0].address,
									remark: arr[0].remark
								});
							}
							
						}						
					}
				]
				
			});
			
			/**
			 * 详单表格初始化
			 */
			$('#detailGrid').datagrid({
				
				idField:'id',
				//ajax异步后台请求
				url: '',
				fit: true,
				//自动列间距
				fitColumns: false,
				border: false,
				//分页查询
				pagination: false,
				//加载等待提示
				loadMsg:'数据正在加载中，请耐心等待…',
				rownumbers:true,
				//列内容
				columns:[[
				    {
				    	title:'进购详单ID',
						field:'id',
						width:100,
						hidden: true
				    },{
				    	title:'进购订单ID',
						field:'purchaseId',
						width:150,
						hidden: true
				    },{
						title:'商品ID',
						field:'commodityId',
						width:50,
						sortable: false
					},{
						title:'商品名称',
						field:'commodityName',
						width:100
					},{
						title:'进购价',
						field:'price',
						width:100
					},{
						title:'进购数量',
						field:'amount',
						width:100,
					},{
						title:'退货数量',
						field:'returnedAmount',
						width:100
					},{
						title:'总价',
						field:'totalPrice',
						width:100,
					}
				]]
				
				
				
				
			});
			
			
			/**
			 * 表单提交按钮
			 */
			$('#saveButton').click(function(){
				if($('#addForm').form('validate')){
					
					$.messager.confirm('提示信息' , '确认入库后订单将无法修改，是否确认入库？' , function(result){
						if(result) {
							var arr = $('#supplierTable').datagrid('getSelections');
							var ids = '';
							/* for(var i=0; i<arr.length; i++) {
								ids += arr[i].purchaseId + ',';
							}
							ids = ids.substring(0, ids.length-1); */
							ids += arr[0].purchaseId;
							$.ajax({
								type: 'post',
								url: 'inStockAction_purchase',
								cache: false,
								data: $('#addForm').serialize() + '&ids=' + ids,
								dataType: 'json',
								success: function(result) {
									$('#addDialog').dialog('close');
									if(result.success){
										//1.刷新数据表格
										$('#supplierTable').datagrid('reload');
										//2.给出提示信息
										$.messager.show ({
											title: "ok!",
											msg: result.message
										});
										//3.清楚数据表格勾选
										$('#supplierTable').datagrid('clearSelections');
										$('#addForm').form('reset');
										$('#supplierTable').datagrid('reload');
										$('#detailGrid').datagrid('loadData',{total:0,rows:[]});
										
									} else {
										$.messager.show ({
											title: "fail!",
											msg: result.message
										});
									}
								},
							});
							
						} else {
							return;
						}
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
				$('#supplierTable').datagrid('load', serializeForm($('#commoditySearch')));
				$('#supplierTable').datagrid('clearSelections');
				$('#detailGrid').datagrid('loadData',{total:0,rows:[]});
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
			 * 设置datebox默认时间
			 */
			$('#beginDate').datebox({
				formatter:myformatter,
				parser:myparser,
				editable:false,
			    required:false,
			    missingMessage:'必须填写日期！'
			});
			/**
			 * 设置datebox默认时间
			 */
			$('#endDate').datebox({
				formatter:myformatter,
				parser:myparser,
				editable:false,
			    required:false,
			    missingMessage:'必须填写日期！'
			});
			
			/**
			 * 入库时间框
			 */
			$('#createDate').datetimebox({    
			    editable: false,   
			    required: true,   
			    missingMessage: '请填写入库时间',
			    showSeconds: true,   
			}); 
		});
		
		//时间格式化
		function myformatter(date){
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		//时间解析
		function myparser(s){
			if (!s) return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0],10);
			var m = parseInt(ss[1],10);
			var d = parseInt(ss[2],10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
				return new Date(y,m-1,d);
			} else {
				return new Date();
			}
		}
		
		
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
		<div region="north" title="进货订单查询" collapsed=false style="height:80px;padding:10px">
			<form id="commoditySearch">
				开始时间：<input id="beginDate" name="beginDate" class="easyui-datebox" />&nbsp;
				结束时间：<input id="endDate" name="endDate" class="easyui-datebox" />&nbsp;
				<a id="searchButton" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
				<a id="clearButton" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">清空</a>
			</form>
		</div>
		<div region="center" title="进货订单总单">
			<table id="supplierTable"></table>
		</div>
		<div region="south" title="进货订单详单" collapsed=false style="height:40%">
			<table id="detailGrid"></table>
		</div>
	</div>
	<div id="addDialog" title="确认入库时间" modal=true class="easyui-dialog"
		closed=true style="width:350px;padding:30px;">
		<form id="addForm" method="post">
			<div style="margin:10px;text-align:center">
				设置入库时间：<input id="createDate" name="createDate" />
			</div>
			<div style="margin:10px;text-align:center">
				<a id="saveButton" class="easyui-linkbutton" iconCls="icon-save" style="margin-right:10px">入库</a>
				<a id="cancelButton" class="easyui-linkbutton" iconCls="icon-cancel" style="margin-left:10px">取消</a>
			</div>
			
		</form>
	</div>
</body>
</html>
