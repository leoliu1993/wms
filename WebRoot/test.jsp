<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-easyui-1.4.2/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.2/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.2/themes/icon.css" />
	<script type="text/javascript" src="js/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.2/locale/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript">
	$(function(){
		
		var flag = '';//添加修改标志
		/**
		 * 表格初始化
		 */
		$('#commodityTable').datagrid({
			
			idField:'commodityId',
			//ajax异步后台请求
			url: 'commodityAction_getCommodityList',
			fit: true,
			//自动列间距
			fitColumns: true,
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
			    	title:'商品编号',
					field:'commodityId',
					width:100,
					hidden: true
			    },{
					title:'商品编号',
					field:'commodityNum',
					width:100
				},{
					title:'商品名称',
					field:'commodityName',
					width:100
				},{
					title:'商品条码',
					field:'commodityBar',
					width:100
				},{
					title:'规格型号',
					field:'commodityType',
					width:100
				},{
					title:'商品分类',
					field:'commodityCategoryId',
					width:100,
				},{
					title:'计量单位',
					field:'commodityUnit',
					width:100,
				},{
					title:'备注',
					field:'remark',
					width:100
				}
			]],
			
			toolbar:[
				{
					text:'添加商品信息',
					iconCls:'icon-add',
					handler:function(){
						
						var arr = $('#commodityTable').datagrid('getSelections');
						console.warn("arr : " + arr.length);
						
					}
				}    
			         
			]
		});
	});
	</script>
  </head>
  
  <body>   
  	<table id="commodityTable"></table>
  </body>  

</html>
