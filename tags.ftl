<#include "./module/page-heading.ftl" />

<@layout.extends name="module/layout.ftl">
    <@layout.put block="title">${blog_title!}</@layout.put>
    <@layout.put block="head">
        <script type="text/javascript" src="${theme_base!}/assets/js/alpine.min.js"></script>
        <script>
            function handleHighlightTag(tag, highlight) {
                const targetTag = document.getElementById("tag-" + tag)
                if (targetTag) {
                    const classList = targetTag.classList
                    highlight ? classList.add('bg-gray-50', 'p-1', 'rounded-lg') : classList.remove('bg-gray-50', 'p-1', 'rounded-lg')
                }
            }
        </script>
    </@layout.put>
    <@layout.put block="content">
        <@tagTag method="count">
            <#assign count="${count!}" />
        </@tagTag>
        <@page_heading title="标签" subtitle="${count!0}" />
        <div class="post-page">
            <div class="post animated fadeInDown">
                <div class="flex flex-row flex-wrap gap-2 mb-10">
                    <@tagTag method="list">
                        <#list tags?sort_by('postCount')?reverse as tag>
                            <a href="#tag-${tag.slug!}"
                               class="text-sm text-black/80 hover:text-black hover:underline hover:font-medium"
                               @mouseenter="handleHighlightTag('${tag.slug!}',true)"
                               @mouseleave="handleHighlightTag('${tag.slug!}',false)">
                                #${tag.name!}（${tag.postCount!}）
                            </a>
                        </#list>
                    </@tagTag>
                </div>
                <div class="grid grid-cols-1 gap-8 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-2">
                    <@tagTag method="list">
                        <#list tags?sort_by('postCount')?reverse as tag>
                            <div id="tag-${tag.slug!}" class="transition-all duration-300">
                                <a href="${tag.fullPath!}" class="hover:underline underline-offset-1">
                                    <div class="inline-flex text-base font-medium text-gray-800 items-center">
                                        <i class="iconify w-5 h-5" data-icon="mdi:tag"></i>
                                        <span class="ml-2">
                                        ${tag.name!}
                                        <sup class="text-gray-400 ml-1">${tag.postCount!}</sup>
                                    </span>
                                    </div>
                                </a>
                                <div class="mt-3">
                                    <@postTag method="listByTagId" tagId="${tag.id?c}">
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
                                                        <a href="${tag.fullPath!}"
                                                           class="text-sm text-black/60 hover:text-black hover:underline hover:font-medium inline-flex items-center">
                                                            <i class="iconify mr-2"
                                                               data-icon="mdi:unfold-more-vertical"></i>
                                                            更多
                                                        </a>
                                                    </div>
                                                </#if>
                                            <#else>
                                                <div class="text-sm text-gray-300">此标签没有文章</div>
                                            </#if>
                                        </div>
                                    </@postTag>
                                </div>
                            </div>
                        </#list>
                    </@tagTag>
                </div>
            </div>
        </div>
    </@layout.put>
</@layout.extends>