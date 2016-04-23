








{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">兑换码</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
				
					
					
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">兑换码</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="code">兑换码</label>
											<input class="form-control" id="code" type="text">
										</div>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="code-update" ><span class="icon">check</span>&nbsp;兑换</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<div class="card-table">
											<div class="table-responsive">
												{$codes->render()}
												<table class="table table-hover">
													<tr>
														<th>ID</th>
														<th>代码</th>
														<th>类型</th>
														<th>操作</th>
														<th>使用时间</th>
														
													</tr>
													{foreach $codes as $code}
														<tr>
															<td>#{$code->id}</td>
															<td>{$code->code}</td>
															{if $code->type==10001}
															<td>流量充值</td>
															{/if}
															{if $code->type==10002}
															<td>用户续期</td>
															{/if}
															{if $code->type>=1&&$code->type<=10000}
															<td>等级续期 - 等级{$code->type}</td>
															{/if}
															{if $code->type==10001}
															<td>充值了 {$code->number} GB 流量</td>
															{/if}
															{if $code->type==10002}
															<td>延长账户有效期 {$code->number} 天</td>
															{/if}
															{if $code->type>=1&&$code->type<=10000}
															<td>延长等级有效期 {$code->number} 天</td>
															{/if}
															<td>{$code->usedatetime}</td>
														</tr>
													{/foreach}
												</table>
												{$codes->render()}
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
					<div aria-hidden="true" class="modal fade" id="result" role="dialog" tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-heading">
									<a class="modal-close" data-dismiss="modal">×</a>
									<h2 class="modal-title">操作结果</h2>
								</div>
								<div class="modal-inner">
									<p id="msg"></p>
								</div>
								<div class="modal-footer">
									<button class="btn btn-flat btn-brand waves-attach" data-dismiss="modal" type="button">知道了</button></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


<script>
    $(document).ready(function () {
        $("#code-update").click(function () {
            $.ajax({
                type: "POST",
                url: "code",
                dataType: "json",
                data: {
                    code: $("#code").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
					$("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>
