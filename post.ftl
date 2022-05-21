<#include "./module/page-heading.ftl" />

<@layout.extends name="module/layout.ftl">
    <@layout.put block="title">${post.title!} - ${blog_title!}</@layout.put>
    <@layout.put block="head">
        <#include "./module/highlightjs/libs-import.ftl" />
        <#include "./module/lightgallery/libs-import.ftl" />
        <#include "./module/katex/libs-import.ftl" />
    </@layout.put>
    <@layout.put block="content">
        <@page_heading title="${post.title!}" subtitle="">
            <div class="post-info mt-2">
                <div class="meta">
                    <div class="info">
                        <i class="iconify w-3 h-3" data-icon="mdi:calendar-month-outline"></i>
                        <span class="date">${post.createTime?string("yyyy-MM-dd")}</span>
                        <i class="iconify w-3 h-3" data-icon="mdi:comment-outline"></i>
                        <a href="${post.fullPath!}#comment_widget">${post.commentCount!}</a>
                        <#if post.categories?size gt 0>
                            <i class="iconify w-3 h-3" data-icon="mdi:folder-outline"></i>
                            <#list post.categories as category>
                                <a href="${category.fullPath}" title="${category.name!}">${category.name}</a>
                            </#list>
                        </#if>
                        <#if tags?size gt 0>
                            <i class="iconify w-3 h-3" data-icon="mdi:tag"></i>
                            <#list tags as tag>
                                <a href="${tag.fullPath!}" title="${tag.name}">${tag.name}</a>
                            </#list>
                        </#if>
                    </div>
                </div>
            </div>
        </@page_heading>
        <div class="post-page">
            <div class="post animated fadeInDown">
                <div id="post-content" class="post-content markdown-body">
                    ${post.formatContent!}
                </div>
            </div>
            <div class="pagination flex justify-between items-center">
                <#if prevPost??>
                    <a class="btn" role="navigation" href="${prevPost.fullPath!}" title="${prevPost.title}">上一篇</a>
                </#if>
                <#if nextPost??>
                    <a class="btn" role="navigation" href="${nextPost.fullPath!}" title="${nextPost.title}">
                        下一篇
                    </a>
                </#if>
            </div>
            <div id="comment_widget" style="margin: 30px;">
                <#include "module/comment.ftl">
                <@comment post=post type="post" />
            </div>
        </div>
    </@layout.put>

    <@layout.put block="footer">
        <#include "./module/highlightjs/scripts.ftl" />
        <#include "./module/lightgallery/scripts.ftl" />
    </@layout.put>
</@layout.extends>