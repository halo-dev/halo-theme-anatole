<#include "./module/layout.ftl" />
<#include "./module/page-heading.ftl" />
<@layout title="${sheet.title!} - ${blog_title!}">
    <@page_heading title="${post.title!}" subtitle="">
        <div class="post-info mt-2">
            <div class="meta">
                <div class="info">
                    <i class="iconify w-3 h-3" data-icon="mdi:calendar-month-outline"></i>
                    <span class="date">${sheet.createTime?string("yyyy-MM-dd")}</span>
                    <i class="iconify w-3 h-3" data-icon="mdi:comment-outline"></i>
                    <a href="${sheet.fullPath!}#comment_widget">Comments</a>
                </div>
            </div>
        </div>
    </@page_heading>
    <div class="post-page">
        <div class="post animated fadeInDown">
            <div id="post-content" class="post-content markdown-body">
                ${sheet.formatContent!}
            </div>
        </div>
        <div id="comment_widget" style="margin: 30px;">
            <#include "module/comment.ftl">
            <@comment post=sheet type="sheet" />
        </div>
    </div>
</@layout>