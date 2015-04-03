<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品信息管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/icon.css" />
	<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript">
		$(function(){
			/**
			表格初始化
			
			*/
			$('#t_commodity').datagrid({
				
				idField:'id',
				url: 'commodity_getCommodityList',
				fit: true,
				fitColumns: true,//自动列间距
				border: false,
				loadMsg:'数据正在加载中，请耐心等待…',
				columns:[[
					{
						title:'商品编号',
						field:'commodityId',
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
						field:'commodityCategory.categoryName',
						width:100
					},{
						title:'计量单位',
						field:'unit.unit',
						width:100
					},{
						title:'备注',
						field:'remark',
						width:100
					}
				]],
				pagination: true
				
				
			});
			
		});
		
	
	</script>
			
  </head>
  
  <body>
  	<div id="lay" class="easyui-layout" style="width: 100%;height:100%" >
		<div region="north" title="商品信息查询" style="height:100px;" >
		
		</div>
		<div region="center" title="商品信息管理">
			<table id="t_commodity"></table>
		</div>
	</div>
  			
 			
  </body>
</html>
