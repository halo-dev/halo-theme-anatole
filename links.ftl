<#include "./module/layout.ftl" />
<@layout title="友情链接 - ${blog_title!}">
    <div class="post-page">
        <div class="post animated fadeInDown">
            <div class="post-title">
                <h3>友情链接</h3>
            </div>
            <div class="post-content">
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