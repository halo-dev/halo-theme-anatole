<#include "./module/layout.ftl" />
<#include "./module/page-heading.ftl" />
<@layout title="友情链接 - ${blog_title!}">
    <@page_heading title="友情链接" subtitle="">
    </@page_heading>
    <div class="post-page">
        <div class="post animated fadeInDown">
            <div class="post-content markdown-body">
                <@linkTag method="list">
                    <#if links?? && links?size gt 0>
                        <#list links as link>
                            <p>
                                <a href="${link.url}" target="_blank" rel="external">${link.name}</a>
                                <#if link.description!=''>
                                    – ${link.description}
                                </#if>
                            </p>
                        </#list>
                    </#if>
                </@linkTag>
            </div>
        </div>
    </div>
</@layout>