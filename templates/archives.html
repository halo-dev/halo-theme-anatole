<@layout.extends name="module/layout.ftl">
    <@layout.put block="title">归档 - ${blog_title!}</@layout.put>
    <@layout.put block="content">
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
            <@paginationTag method="archives" page="${posts.number?c}" total="${posts.totalPages?c}" display="3">
                <div class="pagination flex justify-between items-center">
                    <#if pagination.hasPrev>
                        <a class="btn" role="navigation" href="${pagination.prevPageFullPath!}">上一页</a>
                    </#if>
                    <span class="text-sm">${posts.number+1}/${posts.totalPages!}</span>
                    <#if pagination.hasNext>
                        <a class="btn" role="navigation" href="${pagination.nextPageFullPath!}">下一页</a>
                    </#if>
                </div>
            </@paginationTag>
        </#if>
    </@layout.put>
</@layout.extends>