<#include "./module/page-heading.ftl" />
<@layout.extends name="module/layout.ftl">
    <@layout.put block="title">搜索结果：${blog_title!}</@layout.put>
    <@layout.put block="content">
        <@page_heading title="搜索：${keyword!}" subtitle="${posts.totalElements!} 篇文章" />
        <#if posts?? && posts.content?size gt 0>
            <div x-data="posts">
                <#include "module/post-entry.ftl">
            </div>
            <#if posts.totalPages gt 1>
                <@paginationTag method="search" page="${posts.number?c}" total="${posts.totalPages?c}" display="3" keyword="${keyword!}">
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
        <#else>
            <div class="">
                <h3 class="page-title">没有找到任何东西！</h3>
            </div>
        </#if>
    </@layout.put>
    <@layout.put block="footer">
        <#include "./module/post-likes/scripts.ftl" />
    </@layout.put>
</@layout.extends>