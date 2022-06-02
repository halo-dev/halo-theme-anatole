<#list posts.content as post>
    <div class="post animated fadeInDown">
        <div class="post-title">
            <h3 class="font-medium">
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
                    <#if post.tags?size gt 0>
                        <i class="iconify w-3 h-3" data-icon="mdi:tag"></i>
                        <#list post.tags as tag>
                            <a href="${tag.fullPath}" title="${tag.name!}">#${tag.name}</a>
                        </#list>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</#list>
