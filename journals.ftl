<#include "./module/layout.ftl" />
<#include "./module/page-heading.ftl" />
<#include "./module/comment.ftl">
<script type="text/javascript" src="${theme_base!}/assets/js/alpine.min.js"></script>
<@layout title="日志 - ${blog_title!}">
    <@page_heading title="日志" subtitle="${journals.totalElements!} 篇" />
    <div class="post-page">
        <div class="post animated fadeInDown">
            <ul role="list" class="divide-y divide-gray-100">
                <#list journals.content as journal>
                    <li class="py-5 flex items-start" x-data="{ comment: false }">
                        <img class="h-12 w-12 rounded-full" src="${user.avatar!}" alt="${user.nickname!}">
                        <div class="ml-5 flex-1">
                            <div class="markdown-body !text-sm !text-gray-500">
                                ${journal.content!}
                            </div>
                            <div class="flex items-center gap-4 mt-3">
                                <div class="inline-flex items-center cursor-pointer text-gray-400 hover:text-black text-sm transition-all">
                                    <i class="iconify w-3.5 3.5" data-icon="mdi:heart-outline"></i>
                                    <span class="ml-1">
                                         ${journal.likes!0}
                                    </span>
                                </div>
                                <div class="inline-flex items-center cursor-pointer text-gray-400 hover:text-black text-sm transition-all"
                                     x-on:click="comment = !comment">
                                    <i class="iconify w-3.5 h-3.5" data-icon="mdi:comment-outline"></i>
                                    <span class="ml-1">
                                        ${journal.commentCount!0}
                                    </span>
                                </div>
                                <div class="sm:hidden inline-flex items-center cursor-pointer text-gray-400 hover:text-black text-sm transition-all">
                                    <i class="iconify w-3.5 h-3.5" data-icon="mdi:calendar-month-outline"></i>
                                    <span class="ml-1">${journal.createTime?string("yyyy-MM-dd HH:mm")}</span>
                                </div>
                            </div>

                            <template x-if="comment">
                                <div class="mt-2">
                                    <@comment post=journal type="journal"></@comment>
                                </div>
                            </template>
                        </div>
                        <div class="hidden sm:flex">
                            <time class="text-gray-400 text-sm">${journal.createTime?string("yyyy-MM-dd HH:mm")}</time>
                        </div>
                    </li>
                </#list>
            </ul>
        </div>
    </div>
    <#if journals.totalPages gt 1>
        <@paginationTag method="journals" page="${journals.number}" total="${journals.totalPages}" display="3">
            <div class="pagination flex justify-between items-center">
                <#if pagination.hasPrev>
                    <a class="btn" role="navigation" href="${pagination.prevPageFullPath!}">上一页</a>
                </#if>
                <span class="text-sm">${journals.number+1}/${journals.totalPages!}</span>
                <#if pagination.hasNext>
                    <a class="btn" role="navigation" href="${pagination.nextPageFullPath!}">下一页</a>
                </#if>
            </div>
        </@paginationTag>
    </#if>
</@layout>