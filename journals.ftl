<#include "./module/page-heading.ftl" />
<#include "./module/comment.ftl">
<@layout.extends name="module/layout.ftl">
    <@layout.put block="title">日志 - ${blog_title!}</@layout.put>
    <@layout.put block="head">
        <#include "./module/highlightjs/libs-import.ftl" />
        <#include "./module/lightgallery/libs-import.ftl" />
        <#include "./module/katex/libs-import.ftl" />
        <script src="${theme_base!}/assets/js/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/gh/halo-dev/halo-comment@latest/dist/halo-comment.min.js'}"></script>
    </@layout.put>
    <@layout.put block="content">
        <@page_heading title="日志" subtitle="${journals.totalElements!} 篇" />
        <div class="post-page">
            <div class="post animated fadeInDown">
                <ul role="list" class="divide-y divide-gray-100" x-data="journals">
                    <#list journals.content as journal>
                        <li class="py-5 flex items-start gap-2" x-data="{comment:false}">
                            <img class="h-12 w-12 rounded-full" src="${user.avatar!}" alt="${user.nickname!}">
                            <div class="ml-5 flex-1">
                                <div class="markdown-body !text-sm !text-gray-500">
                                    ${journal.content!}
                                </div>
                                <div class="flex items-center gap-4 mt-3">
                                    <div class="journal-likes inline-flex items-center cursor-pointer text-gray-400 hover:text-red-700 text-sm transition-all"
                                         x-bind:class="{'text-red-700': liked(${journal.id?c})}"
                                         x-on:click="handleLike(${journal.id?c})">
                                        <i x-show="liked(${journal.id?c})" class="iconify w-3.5 h-3.5"
                                           data-icon="mdi:heart"></i>
                                        <i x-show="!liked(${journal.id?c})" class="iconify w-3.5 h-3.5"
                                           data-icon="mdi:heart-outline"></i>
                                        <span class="ml-1" data-journal-id-likes="${journal.id?c}">
                                            ${journal.likes?c}
                                        </span>
                                    </div>
                                    <div class="inline-flex items-center cursor-pointer text-gray-400 hover:text-black text-sm transition-all"
                                         x-on:click="comment = !comment">
                                        <i class="iconify w-3.5 h-3.5" data-icon="mdi:comment-outline"></i>
                                        <span class="ml-1">
                                        ${journal.commentCount!0}
                                    </span>
                                    </div>
                                    <div class="sm:hidden inline-flex items-center cursor-pointer text-gray-400 hover:text-black text-sm transition-all">
                                        <i class="iconify w-3.5 h-3.5" data-icon="mdi:calendar-month-outline"></i>
                                        <span class="ml-1">${journal.createTime?string("yyyy-MM-dd HH:mm")}</span>
                                    </div>
                                </div>

                                <template x-if="comment">
                                    <div class="mt-2">
                                        <@comment post=journal type="journal"></@comment>
                                    </div>
                                </template>
                            </div>
                            <div class="hidden sm:flex">
                                <time class="text-gray-400 text-sm">${journal.createTime?string("yyyy-MM-dd HH:mm")}</time>
                            </div>
                        </li>
                    </#list>
                </ul>
            </div>
        </div>
        <#if journals.totalPages gt 1>
            <@paginationTag method="journals" page="${journals.number}" total="${journals.totalPages}" display="3">
                <div class="pagination flex justify-between items-center">
                    <#if pagination.hasPrev>
                        <a class="btn" role="navigation" href="${pagination.prevPageFullPath!}">上一页</a>
                    </#if>
                    <span class="text-sm">${journals.number+1}/${journals.totalPages!}</span>
                    <#if pagination.hasNext>
                        <a class="btn" role="navigation" href="${pagination.nextPageFullPath!}">下一页</a>
                    </#if>
                </div>
            </@paginationTag>
        </#if>
    </@layout.put>

    <@layout.put block="footer">
        <#include "./module/highlightjs/scripts.ftl" />
        <script type="text/javascript">
            const markdownBodyNodes = document.getElementsByClassName('markdown-body');

            if (markdownBodyNodes) {
                for (let i = 0; i < markdownBodyNodes.length; i++) {
                    const markdownBodyNode = markdownBodyNodes[i];
                    const imageNodes = markdownBodyNode.querySelectorAll("img")

                    imageNodes.forEach(function (node) {
                        if (node) {
                            node.dataset.src = node.src;
                        }
                    })

                    lightGallery(markdownBodyNode, {
                        selector: 'img',
                    })
                }
            }

            document.addEventListener("alpine:init", () => {
                Alpine.data("journals", () => ({
                    likedIds: [],
                    init() {
                        this.likedIds = JSON.parse(localStorage.getItem("anatole.likes.journal.ids") || "[]");
                    },
                    liked(id) {
                        return this.likedIds.includes(id);
                    },
                    async handleLike(journalId) {
                        if (this.liked(journalId)) {
                            return
                        }

                        const xhr = new XMLHttpRequest();

                        xhr.open('POST', "/api/content/journals/" + journalId + "/likes");

                        xhr.onload = () => {
                            this.likedIds = [...this.likedIds, journalId];
                            localStorage.setItem('anatole.likes.journal.ids', JSON.stringify(this.likedIds));

                            const likesNode = document.querySelector("[data-journal-id-likes=\"" + journalId + "\"]");
                            const likes = parseInt(likesNode.innerText);
                            likesNode.innerText = likes + 1;
                        }
                        xhr.onerror = function () {
                            alert("网络请求失败，请稍后再试");
                        };
                        xhr.send();
                    }
                }))
            })
        </script>
    </@layout.put>
</@layout.extends>
