<#include "./module/layout.ftl" />
<@layout title="${blog_title!}">
    <#include "module/post-entry.ftl">
    <#if posts.totalPages gt 1>
        <@paginationTag method="index" page="${posts.number?c}" total="${posts.totalPages?c}" display="3">
          <div class="pagination">
            <ul class="clearfix">
                <#if pagination.hasPrev>
                  <li class="pre">
                    <a class="btn" role="navigation" href="${pagination.prevPageFullPath!}">上一页</a>
                  </li>
                </#if>
                <#if pagination.hasNext>
                  <li class="next">
                    <a class="btn" role="navigation" href="${pagination.nextPageFullPath!}">下一页</a>
                  </li>
                </#if>
            </ul>
          </div>
        </@paginationTag>
    </#if>
</@layout>