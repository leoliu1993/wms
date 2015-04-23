<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>智慧仓库管理系统</title>
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
	<style type="text/css">
		.easyui-accordion p {list-style:none;margin:0px;padding:2px}
		.easyui-accordion p a {line-height:24px;display:block;padding-left:10px}
		.easyui-accordion p a:hover{border:1px dashed #99bbe8;background:#e0ecff;color:#416aa3;cursor:pointer;}
		.icon{background:url(<%=path%>/images/tabicons.png) no-repeat;height:18px;width:18px}
		/**
		 * 库存管理模块
		 */
		.icon-instorage1{background-position:-200px -80px}
		.icon-instorage2{background-position:-60px -40px}
		.icon-outstorage1{background-position:-60px -140px}
		.icon-outstorage2{background-position:-160px -40px}
		.icon-transferstorage{background-position:-360px -20px}
		.icon-managestorage{background-position:-380px -200px}
		/**
		 * 基础资料管理模块
		 */
		.icon-client{background-position:-160px -480px}
		.icon-supplier{background-position:-140px -480px}
		.icon-staff{background-position:-100px -480px}
		.icon-warehouse{background-position:-200px -220px}
		.icon-right{background-position:-380px -220px}
		.icon-goods{background-position:-140px -280px}
		/**
		 * 辅助资料管理模块
		 */
		.icon-unitcategory{background-position:-340px -260px}
		.icon-goodscategory{background-position:-260px -420px}
		.icon-clientcategory{background-position:-80px -420px}
		.icon-suppliercategory{background-position:-360px -200px}
	</style>
	
	<script type="text/javascript">
		
		
		$(function(){
			
			$('a[title]').click(function(){
				
				var src = $(this).attr('title');
				var title = $(this).html();
				
				if($('#tt').tabs('exists', title)) {
					//选中标签
					$('#tt').tabs('select',title);
					
				} else {
					
					//添加新标签
					$('#tt').tabs('add',{ 
					    title:title,    
					    content:'<iframe frameborder=0 style=width:100%;height:100% src='+ src +' ></iframe>',
					    closable:true 
					});
					
				}
				
			})
			
		});
		
		// add a new tab panel    
		$('#tt').tabs('add',{    
		    title:'New Tab',    
		    content:'Tab Body',    
		    closable:true,    
		    tools:[{    
		        iconCls:'icon-mini-refresh',    
		        handler:function(){    
		            alert('refresh');    
		        }    
		    }]    
		});  
	</script>
  </head>
  
  <body class="easyui-layout">   
  	<!-- 顶部标题 -->
    
    
    <!-- 下部主体内容 -->
    <div border="true" data-options="region:'center'">
        <div border="false" class="easyui-layout" data-options="fit:true">
        	<!-- 左侧导航 -->
			<div border="true" data-options="region:'west',title:'功能导航'"
				split="true" style="width:200px">
				<div id="aa" border="false" class="easyui-accordion" fit=true>
					<div title="库存管理" class="Div10">
						<p>
							<a title="purchaseAction_addPage"><span class="icon icon-instorage1">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>采购入库</a>
						</p>
						<p>
							<a title="test.jsp"><span class="icon icon-instorage2">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>其他入库</a>
						</p>
						<p>
							<a title="test.jsp"><span class="icon icon-outstorage1">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>销售出库</a>
						</p>
						<p>
							<a title="test.jsp"><span class="icon icon-outstorage2">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>其它出库</a>
						</p>
						<p>
							<a title="test.jsp"><span class="icon icon-transferstorage">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>仓库调拨</a>
						</p>
						<p>
							<a title="test.jsp"><span class="icon icon-managestorage">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>库存管理</a>
						</p>
					</div>
					<div title="仓位管理" style="overflow:auto;padding:10px;"">
						content2</div>
					<div title="财务分析">content3</div>
					<div title="基础资料管理" style="overflow:auto;padding:10px;">
						<p>
							<a title="test.jsp"><span class="icon icon-client">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>客户管理</a>
						</p>
						<p>
							<a title="supplierAction_managementPage"><span class="icon icon-supplier">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>供应商管理</a>
						</p>
						<p>
							<a title="commodityAction_managementPage"><span
								class="icon icon-goods">&nbsp;&nbsp;&nbsp;&nbsp; </span>商品管理</a>
						</p>
						<p>
							<a title="test.jsp"><span class="icon icon-warehouse">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>仓库管理</a>
						</p>
						<p>
							<a title="test.jsp"><span class="icon icon-staff">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>职员管理</a>
						</p>
						<p>
							<a title="test.jsp"><span class="icon icon-right">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>权限管理</a>
						</p>
					</div>
					<div title="辅助资料管理" style="overflow:auto;padding:10px;">
						<p>
							<a title="clientAction_managementPage"><span class="icon icon-clientcategory">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>客户类别</a>
						</p>
						<p>
							<a title="supplierAction_managementPage"><span class="icon icon-suppliercategory">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>供应商类别</a>
						</p>
						<p>
							<a title="cmdtCtgrAction_managementPage"><span class="icon icon-goodscategory">&nbsp;&nbsp;&nbsp;&nbsp;
							</span>商品类别</a>
						</p>
						<p>
							<a title="unitAction_managementPage"><span
								class="icon icon-unitcategory">&nbsp;&nbsp;&nbsp;&nbsp; </span>计量单位</a>
						</p>
					</div>
					<div title="设置">content3</div>
				</div>

			</div>

			<!-- 中心主体内容 -->
            <div border="false" data-options="region:'center',title:'欢迎使用智慧仓库管理系统'">
            	<!-- 标签 -->
				<div id="tt" class="easyui-tabs" fit=true>
					<div title="首页" style="padding:10px">
						<div class="fl" style="width:29%;height:250px;margin-right:10px;margin:10px">
							<div class="easyui-panel"
								data-options="title:'库存信息',collapsible:true,iconCls:'icon-ok'"
								fit=true></div>
						</div>
						<div class="fl" style="width:29%;height:250px;margin-left:10px;margin:10px">
							<div class="easyui-panel"
								data-options="title:'仓库信息',collapsible:true,iconCls:'icon-ok'"
								fit=true></div>
						</div>
						<div class="fl" style="width:29%;height:250px;margin-right:10px;margin:10px">
							<div class="easyui-panel"
								data-options="title:'财务信息',collapsible:true,iconCls:'icon-ok'"
								fit=true></div>
						</div>
						<div class="clear"></div>
						<div class="fl" style="width:29%;height:250px;margin:10px">
							<div class="easyui-panel"
								data-options="title:'资料管理',collapsible:true,iconCls:'icon-ok'"
								fit=true></div>
						</div>
					</div>
				</div>
			</div>
            
            <!-- 下部信息 -->
			<div border="false" region="south"
				style="text-align:center; background:#fafafa;font-weight:bold">Copyright
				&copy; 2015 NCUT All Rights Reserved. 京ICP证1000001号</div>
		</div>
    </div>   
  </body>  

</html>
