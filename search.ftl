<#include "module/macro.ftl">
<@head title="搜索结果：${keyword!} - ${blog_title!}"/>
<#include "module/sidebar.ftl">
<div class="main">
    <#include "module/page-top.ftl">
    <div class="autopagerize_page_element">
        <div class="content">
		<#if posts?? && posts.content?size gt 0>
			<#include "module/post-entry.ftl">
            <#if posts.totalPages gt 1>
                <@paginationTag method="search" page="${posts.number?c}" total="${posts.totalPages?c}" display="3" keyword="${keyword!}">
                    <div class="pagination">
                        <ul class="clearfix">
                            <#if pagination.hasPrev>
                                <li class="pre pagbuttons">
                                    <a class="btn" role="navigation" href="${pagination.prevPageFullPath!}">上一页</a>
                                </li>
                            </#if>
                            <#if pagination.hasNext>
                                <li class="next pagbuttons">
                                    <a class="btn" role="navigation" href="${pagination.nextPageFullPath!}">下一页</a>
                                </li>
                            </#if>
                        </ul>
                    </div>
                </@paginationTag>
            </#if>
		<#else>
			<div class="post">
				<h3 class="page-title">没有找到任何东西！</h3>
			</div>
		</#if>
        </div>
    </div>
</div>
<@footer></@footer>