<input type="hidden" id="pageNumber" name="pageNumber" value="${page.pageNumber}" />
<div class="row">
	<div class="col-md-5 col-sm-12">
		<div class="dataTables_info" id="sample_1_info" role="status" aria-live="polite">${message("admin.page.total", page.total)}</div>
	</div>
	<div class="col-md-7 col-sm-12">
		<div class="dataTables_paginate paging_bootstrap_full_number">
			[#if totalPages > 1]
				<ul class="pagination" style="visibility: visible;">
					<li class="prev [#if isFirst]disabled[/#if]">
						<a href="[#if isFirst]javascript:;[#else]javascript: $.pageSkip(${firstPageNumber});[/#if]" title="First"><i class="fa fa-angle-double-left"></i></a>
					</li>
					<li class="prev [#if isFirst]disabled[/#if]">
						<a href="[#if hasPrevious]javascript: $.pageSkip(${previousPageNumber});[#else]javascript:;[/#if]" title="Prev"><i class="fa fa-angle-left"></i></a>
					</li>
					[#list segment as segmentPageNumber]
						[#if segmentPageNumber != pageNumber]
							<li>
								<a href="javascript: $.pageSkip(${segmentPageNumber});">${segmentPageNumber}</a>
							</li>
						[#else]
							<li class="active">
								<a href="javascript:;">${segmentPageNumber}</a>
							</li>
						[/#if]
					[/#list]
					<li class="next [#if isLast]disabled[/#if]">
						<a href="[#if hasNext]javascript: $.pageSkip(${nextPageNumber});[#else]javascript:;[/#if]" title="Next"><i class="fa fa-angle-right"></i></a>
					</li>
					<li class="next [#if isLast]disabled[/#if]">
						<a href="[#if isLast]javascript:;[#else]javascript: $.pageSkip(${lastPageNumber});[/#if]" title="Last"><i class="fa fa-angle-double-right"></i></a>
					</li>
				</ul>
			[/#if]
		</div>
	</div>
</div>
