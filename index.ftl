<#include "./module/layout.ftl" />
<@layout title="${blog_title!}">
    <#include "module/post-entry.ftl">
    <#if posts.totalPages gt 1>
        <@paginationTag method="index" page="${posts.number?c}" total="${posts.totalPages?c}" display="3">
            <div class="pagination flex justify-between items-center">
                <#if pagination.hasPrev>
                    <a class="btn w-20" role="navigation" href="${pagination.prevPageFullPath!}" title="上一页">上一页</a>
                </#if>
                <span class="text-sm">${posts.number+1}/${posts.totalPages!}</span>
                <#if pagination.hasNext>
                    <a class="btn w-20" role="navigation" href="${pagination.nextPageFullPath!}" title="下一页">下一页</a>
                </#if>
            </div>
        </@paginationTag>
    </#if>
</@layout>