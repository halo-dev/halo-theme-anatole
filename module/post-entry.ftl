<#list posts.content as post>
    <div class="post animated fadeInDown">
        <div class="post-title">
            <h3>
                <a href="${post.fullPath!}">${post.title}</a>
            </h3>
        </div>
        <div class="post-content text-black/50 text-sm">
            <p class="py-2.5">${post.summary!}...</p>
        </div>
        <div class="post-info pb-[30px] border-b border-b-[#f2f2f2]">
            <div class="meta">
                <div class="info">
                    <i class="iconify w-3 h-3" data-icon="mdi:calendar-month-outline"></i>
                    <span class="date">${post.createTime?string("yyyy-MM-dd")}</span>
                    <i class="iconify w-3 h-3" data-icon="mdi:comment-outline"></i>
                    <a href="${post.fullPath!}#comment_widget">Comments</a>
                    <#if post.tags?size gt 0>
                        <i class="iconify w-3 h-3" data-icon="mdi:tag"></i>
                        <#list post.tags as tag>
                            <a href="${tag.fullPath}" class="tag">&nbsp;${tag.name}</a>
                        </#list>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</#list>
