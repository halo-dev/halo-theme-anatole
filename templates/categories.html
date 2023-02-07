<#include "./module/page-heading.ftl" />
<@layout.extends name="module/layout.ftl">
    <@layout.put block="title">分类目录 - ${blog_title!}</@layout.put>
    <@layout.put block="content">
        <@categoryTag method="count">
            <#assign count="${count!}" />
        </@categoryTag>
        <@page_heading title="分类目录" subtitle="${count!0}" />
        <div class="post-page">
            <div class="post animated fadeInDown">
                <div class="grid grid-cols-1 gap-8 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-2">
                    <@categoryTag method="list">
                        <#list categories?sort_by('postCount')?reverse as category>
                            <div>
                                <a href="${category.fullPath!}" class="hover:underline underline-offset-1">
                                    <div class="inline-flex text-base font-medium text-gray-800 items-center">
                                        <i class="iconify w-5 h-5" data-icon="mdi:folder-outline"></i>
                                        <span class="ml-2">
                                        ${category.name!}
                                        <sup class="text-gray-400 ml-1">${category.postCount!}</sup>
                                    </span>
                                    </div>
                                </a>
                                <div class="mt-3">
                                    <@postTag method="listByCategoryId" categoryId="${category.id?c}">
                                        <div class="flex flex-col pl-5 gap-y-2">
                                            <#if posts?size gt 0>
                                                <#list posts?sort_by("createTime")?reverse as post>
                                                    <#if post_index lt 10>
                                                        <div class="flex justify-between">
                                                            <a href="${post.fullPath!}"
                                                               class="text-sm text-black/80 hover:text-black hover:underline hover:font-medium">${post.title!}</a>
                                                            <span class="text-sm text-gray-300">${post.createTime?string("yyyy-MM-dd HH:mm")}</span>
                                                        </div>
                                                    </#if>
                                                </#list>
                                                <#if posts?size gt 10>
                                                    <div class="flex justify-end mt-2">
                                                        <a href="${category.fullPath!}"
                                                           class="text-sm text-black/60 hover:text-black hover:underline hover:font-medium inline-flex items-center">
                                                            <i class="iconify mr-2"
                                                               data-icon="mdi:unfold-more-vertical"></i>
                                                            更多
                                                        </a>
                                                    </div>
                                                </#if>
                                            <#else>
                                                <div class="text-sm text-gray-300">此分类没有文章</div>
                                            </#if>
                                        </div>
                                    </@postTag>
                                </div>
                            </div>
                        </#list>
                    </@categoryTag>
                </div>
            </div>
        </div>
    </@layout.put>
</@layout.extends>