<#include "module/macro.ftl">
<@head title="归档 · ${options.blog_title!}"/>
<#include "module/sidebar.ftl">
<div class="main">
    <#include "module/page-top.ftl">
    <div class="autopagerize_page_element">
        <div class="content">
            <div class="archive animated fadeInDown">
                <ul class="list-with-title">
                    <#list archives as archive>
                        <div class="listing-title">${archive.year?c}</div>
                        <ul class="listing">
                            <#list archive.posts?sort_by("createTime")?reverse as post>
                                <div class="listing-item">
                                    <div class="listing-post">
                                        <a href="${post.fullPath!}" title="${post.title!}">${post.title!}</a>
                                        <div class="post-time">
                                            <span class="date">${post.createTime?string("yyyy-MM-dd")}</span>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </ul>
                    </#list>
                </ul>
            </div>
            <#if posts.totalPages gt 1>
                <div class="pagination">
                    <ul class="clearfix">
                        <#if posts.hasPrevious()>
                            <li class="pre pagbuttons">
                                <a class="btn" role="navigation" href="${prePageFullPath!}">上一页</a>
                            </li>
                        </#if>
                        <#if posts.hasNext()>
                            <li class="next pagbuttons">
                                <a class="btn" role="navigation" href="${nextPageFullPath!}">下一页</a>
                            </li>
                        </#if>
                    </ul>
                </div>
            </#if>
        </div>
    </div>
</div>
<@footer></@footer>
