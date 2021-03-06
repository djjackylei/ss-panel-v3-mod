

{include file='admin/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">节点在线IP</h1>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-lg-push-0 col-sm-10 col-sm-push-1">
				<section class="content-inner margin-top-no">
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p>部分节点不支持记录。</p>
							</div>
						</div>
					</div>
					
					<div class="table-responsive">
						{$logs->render()}
						
						<table class="table">
							<tr>
								<th>ID</th>
								<th>用户ID</th>
								<th>用户名</th>
								<th>IP</th>
								<th>归属地</th>
								<th>节点ID</th>
								<th>节点名称</th>
							</tr>
							{foreach $logs as $log}
								<tr>
									<td>#{$log->id}</td>
									<td>{$log->userid}</td>
									<td>{$log->user()->user_name}</td>
									<td>{$log->ip}</td>
									<td>{$loc[$log->ip()]}</td>
									<td>{$log->nodeid}</td>
									<td>{$log->node()->name}</td>
								</tr>
							{/foreach}
						</table>
                        {$logs->render()}
					</div>

							
			</div>
			
			
			
		</div>
	</main>












{include file='admin/footer.tpl'}