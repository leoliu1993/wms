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
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/icon.css" />
	<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
	
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
    <div border="true" data-options="region:'north'" style="height:100px"></div>
    
    <!-- 下部主体内容 -->
    <div border="true" data-options="region:'center'">
        <div border="false" class="easyui-layout" data-options="fit:true">
        	<!-- 左侧导航 -->
			<div border="true" data-options="region:'west',title:'导航'" split="true" style="width:180px">
				<div id="aa" border="false" class="easyui-accordion" fit="true">   
				    <div title="库存管理" class="Div10">   
				        <p><a title="test.jsp">采购入库</a></p>
				        <p><a title="test.jsp">其他入库</a></p>
				        <p><a title="test.jsp">销售出库</a></p>
				        <p><a title="test.jsp">其它出库</a></p>
				        <p><a title="test.jsp">仓库调拨</a></p>
				        <p><a title="test.jsp">库存管理</a></p>
				    </div>   
				    <div title="仓位管理" style="overflow:auto;padding:10px;"">   
				        content2    
				    </div>
				    <div title="财务分析">   
				        content3    
				    </div>
				    <div title="基础资料管理" style="overflow:auto;padding:10px;">   
				        <p><a title="test.jsp">客户管理</a></p>
				        <p><a title="test.jsp">供应商管理</a></p>
				        <p><a title="commodity_managementPage">商品管理</a></p>
				        <p><a title="test.jsp">仓库管理</a></p>
				        <p><a title="test.jsp">职员管理</a></p>
				        <p><a title="test.jsp">权限管理</a></p>
				    </div>
				    <div title="辅助资料管理" style="overflow:auto;padding:10px;">   
				        <p><a title="test.jsp">客户类别</a></p>
				        <p><a title="test.jsp">供应商类别</a></p>
				        <p><a title="test.jsp">商品类别</a></p>
				        <p><a title="test.jsp">计量单位</a></p>
				    </div>
				    <div title="设置">   
				        content3    
				    </div>
				</div>
            </div>
            
            <!-- 中心主体内容 -->
            <div border="false" data-options="region:'center'">
            	<!-- 标签 -->
            	<div id="tt" class="easyui-tabs" fit=true>   
    				<div title="首页" style="padding:20px;display:true;">   
        				tab1
    				</div>
				</div>  
            </div>
            
            <!-- 下部信息 -->
            <div border="false" region="south" >Copyright &copy; 2015</div>
        </div>
    </div>   
  </body>  

</html>
