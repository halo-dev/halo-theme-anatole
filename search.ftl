<#include "./module/layout.ftl" />
<@layout title="搜索结果：${keyword!} - ${blog_title!}">
    <div class="m-[30px] mt-[15px] border-b border-gray-200 animated fadeInDown">
        <div class="flex flex-wrap items-baseline">
            <h3 class="text-lg leading-6 font-medium text-gray-900">搜索：${keyword!}</h3>
            <p class="ml-2 text-sm text-gray-500 truncate">${posts.totalElements!} 篇文章</p>
        </div>
    </div>
    <#if posts?? && posts.content?size gt 0>
        <#include "module/post-entry.ftl">
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
</@layout>