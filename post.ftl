<#include "./module/page-heading.ftl" />

<@layout.extends name="module/layout.ftl">
    <@layout.put block="title">${post.title!} - ${blog_title!}</@layout.put>
    <@layout.put block="head">
        <#include "./module/highlightjs/libs-import.ftl" />
        <#include "./module/lightgallery/libs-import.ftl" />
        <#include "./module/katex/libs-import.ftl" />
        <script src="${theme_base!}/assets/js/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/gh/halo-dev/halo-comment@latest/dist/halo-comment.min.js'}"></script>
    </@layout.put>
    <@layout.put block="content">
        <@page_heading title="${post.title!}" subtitle="">
            <div class="post-info mt-2" x-data="posts">
                <div class="meta">
                    <div class="info">
                        <i class="iconify w-3 h-3" data-icon="mdi:calendar-month-outline"></i>
                        <span>${post.createTime?string("yyyy-MM-dd")}</span>
                        <i class="iconify w-3 h-3" data-icon="mdi:eye"></i>
                        <span>${post.visits!0}</span>
                        <i class="iconify w-3 h-3" data-icon="mdi:comment-outline"></i>
                        <a href="${post.fullPath!}#comment_widget">${post.commentCount!}</a>
                        <div class="inline-block hover:text-red-700 cursor-pointer"
                             x-bind:class="{'text-red-700': liked(${post.id?c})}"
                             x-on:click="handleLike(${post.id?c})">
                            <i x-show="liked(${post.id?c})" class="iconify w-3 h-3"
                               data-icon="mdi:heart"></i>
                            <i x-show="!liked(${post.id?c})" class="iconify w-3 h-3"
                               data-icon="mdi:heart-outline"></i>
                            <span data-post-id-likes="${post.id?c}">${post.likes!}</span>
                        </div>
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
        <#include "./module/post-likes/scripts.ftl" />
    </@layout.put>
</@layout.extends>