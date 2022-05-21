<#include "./module/page-heading.ftl" />

<@layout.extends name="module/layout.ftl">
    <@layout.put block="title">标签：${tag.name!} - ${blog_title!}</@layout.put>
    <@layout.put block="content">
        <@page_heading title="标签：${tag.name!}" subtitle="${posts.totalElements!} 篇文章" />
        <#include "module/post-entry.ftl">
        <#if posts.totalPages gt 1>
            <@paginationTag method="tagPosts" page="${posts.number?c}" total="${posts.totalPages?c}" display="3" slug="${tag.slug!}">
                <div class="pagination flex justify-between items-center">
                    <#if pagination.hasPrev>
                        <a class="btn" role="navigation" href="${pagination.prevPageFullPath!}">上一页</a>
                    </#if>
                    <span class="text-sm">${posts.number+1}/${posts.totalPages!}</span>
                    <#if pagination.hasNext>
                        <a class="btn" role="navigation" href="${pagination.nextPageFullPath!}">下一页</a>
                    </#if>
                </div>
            </@paginationTag>
        </#if>
    </@layout.put>
</@layout.extends>
