<input type="hidden" value="${acl.id}" id="id" name="id"  />
<div class="form-group">
	<div class="row">
		 <div class="col-sm-6">
		 	<label class="col-sm-3 control-label"><span class="required"> * </span>名称</label>
            <div class="col-sm-9">
                <input type="text" name="name" id="name" value="${acl.name}" class="form-control">
            </div>
		 </div>
		 <div class="col-sm-6">
		 	<label class="col-sm-3 control-label"><span class="required"> * </span>资源类型</label>
            <div class="col-sm-9">
                <select name="type" id="type" data-placeholder="选择类型..." class="chosen-select"  style="width:350px;" >
             		<option  hassubinfo="true" value="0" [#if acl.type == 0]selected[/#if]>导航</option>
					<option  hassubinfo="true" value="1" [#if acl.type == 1]selected[/#if]>菜单</option>
					<option  hassubinfo="true" value="2" [#if acl.type == 2]selected[/#if]>按钮</option>
				</select>
            </div>
		 </div>
	</div>
</div>
<div class="form-group">
	<div class="row">
		<div class="col-sm-6">
		 	<label class="col-sm-3 control-label">路径</label>
            <div class="col-sm-9">
                <input type="text" name="url" id="url" value="${acl.url}" class="form-control">
            </div>
		</div>
		<div class="col-sm-6">
   			<label class="col-sm-3 control-label">上级资源</label>
            <div class="col-sm-9">
                 <select name="parentId" id="parentId" data-placeholder="上级资源..." class="chosen-select"  style="width:350px;" >
                 	<option  hassubinfo="true" value="">请选择资源</option>
                 	[#list acls as a]
             			<option  hassubinfo="true" value="${a.id}" [#if acl.id == a.id]selected[/#if]>${a.name}</option>
             			[#list a.children as child]
             			<option  hassubinfo="true" value="${child.id}" [#if acl.id == child.id]selected[/#if]>-----${child.name}</option>
             			[/#list]
             		[/#list]
				</select>
            </div>
         </div>
	</div>
</div>
<div class="form-group">
	<div class="row">
		<div class="col-sm-6">
		 	<label class="col-sm-3 control-label">图标</label>
            <div class="col-sm-9">
            	<div class="input-group m-b">
               		<input type="text" name="icon" id="icon" class="form-control">
               		<span class="input-group-btn"> <button tabindex="-1" class="btn btn-white" type="button" id="input-group-addon">[#if acl.icon??]<i class="${acl.icon}"></i>[#else]<i>-</i>[/#if]</button><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#icon_choose">选择</button> </span>
               	 </div>
            </div>
		 </div>
		 <div class="col-sm-6">
		 	<label class="col-sm-3 control-label">权限标识</label>
            <div class="col-sm-9">
                <input type="text" name="permission" value="${acl.permission}" id="permission" class="form-control">
            </div>
		</div>
	</div>
</div>
<div class="form-group">
	<div class="row">
		<div class="col-sm-6">
		 	<label class="col-sm-3 control-label">排序</label>
            <div class="col-sm-9">
            	<div class="input-group m-b">
               		<input type="text" name="sorts" id="sorts" value="${acl.sorts}"  class="form-control">
               	 </div>
            </div>
		 </div>
	</div>
</div>
<div class="hr-line-dashed"></div>
<div class="form-group">
    <div class="col-sm-12 col-sm-offset-10">
        <button class="btn btn-success" type="submit">保存内容</button>
    </div>
</div>