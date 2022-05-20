<#include "./module/layout.ftl" />
<#include "./module/page-heading.ftl" />
<@layout title="友情链接 - ${blog_title!}">
    <@page_heading title="友情链接" subtitle="">
    </@page_heading>
    <div class="post-page">
        <div class="post animated fadeInDown">
            <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
                <@linkTag method="list">
                    <#if links?? && links?size gt 0>
                        <#list links as link>
                            <a href="${link.url}" target="_blank">
                                <div class="relative rounded border border-gray-300 bg-white px-5 py-4 shadow-sm flex items-center space-x-3 hover:border-gray-400">
                                    <#if link.logo?? && link.logo!=''>
                                        <div class="flex-shrink-0">
                                            <img class="h-12 w-12 rounded-full" src="${link.logo!}" alt="${link.name!}">
                                        </div>
                                    </#if>
                                    <div class="flex-1 min-w-0">
                                        <div>
                                            <p class="text-sm font-medium text-gray-900 truncate">${link.name!}</p>
                                            <p class="text-sm text-gray-500 truncate">${link.description}</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </#list>
                    </#if>
                </@linkTag>
            </div>
        </div>
    </div>
</@layout>