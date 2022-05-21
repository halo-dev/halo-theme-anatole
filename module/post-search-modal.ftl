<div
        x-show="postSearchVisible"
        aria-modal="true"
        class="modal-wrapper fixed top-0 left-0 w-full h-full flex flex-row items-center justify-center z-[9999999999]"
        role="dialog"
        tabindex="0"
        @keyup.esc="postSearchVisible = false"
        x-data="{
            keyword: '',
            posts: [],
            searching: false,
            async handleSearch() {
            
                if(!this.keyword) {
                    this.posts = [];
                    return;
                }
            
                this.searching = true;
               
                var xhr = new window.XMLHttpRequest();
                xhr.responseType = 'document';
                
                const _this = this
                xhr.addEventListener('load', function() {
                    
                    const nodes = xhr.response.getElementsByClassName('post');
                
                    if(nodes) {
                        _this.posts = Array.from(nodes).map(node => {
                            const title = node.querySelector('.post-title h3 a').innerText
                            const url = node.querySelector('.post-title h3 a').href
                            const content = node.querySelector('.post-content p').innerText
                            return {
                                title,
                                url,
                                content,
                            }
                        })
                        setTimeout(() => {
                            _this.searching = false
                        }, 200)
                    }
                });
        
                xhr.open('GET', '/search?keyword='+this.keyword);
                xhr.send(null);
            }
        }"
>
    <div
            x-show="postSearchVisible"
            x-transition:enter="ease-out duration-200"
            x-transition:enter-start="opacity-0"
            x-transition:enter-end="opacity-100"
            x-transition:leave="ease-in duration-100"
            x-transition:leave-start="opacity-100"
            x-transition:leave-end="opacity-0"
    >
        <div class="modal-layer flex-none absolute top-0 left-0 w-full h-full transition-opacity bg-gray-500 bg-opacity-75"
             x-on:click="postSearchVisible = false"/>
    </div>
    <div
            x-show="postSearchVisible"
            x-transition:enter="ease-out duration-200"
            x-transition:enter-start="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
            x-transition:enter-end="opacity-100 translate-y-0 sm:scale-100"
            x-transition:leave="ease-in duration-100"
            x-transition:leave-start="opacity-100 translate-y-0 sm:scale-100"
            x-transition:leave-end="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
    >
        <div class="modal-content flex flex-col relative bg-white items-stretch shadow-xl transform transition-all max-w-3xl rounded"
             style="width: calc(100vw - 20px);max-height: calc(100vh - 20px);"
        >
            <div class="modal-header flex justify-between border-b">
                <div class="modal-header-title self-center text-base font-bold px-[16px] py-[12px] flex items-center">
                    <span class="mr-2">搜索</span> <i x-show="searching" class="iconify w-4 h-4 animate-spin"
                                                    data-icon="mdi:loading"></i>
                </div>
                <div class="modal-header-actions flex flex-row self-center h-full">
                    <div class="modal-header-action flex items-center justify-center cursor-pointer bg-gray-50 hover:bg-gray-200 mx-[16px] w-8 h-8 rounded-full"
                         x-on:click="postSearchVisible = false">
                        <i class="iconify w-4 h-4" data-icon="mdi:close"></i>
                    </div>
                </div>
            </div>
            <div class="modal-body overflow-x-hidden overflow-y-auto flex-1 break-word px-[16px] py-[12px]">
                <div>
                    <input type="text"
                           x-model="keyword"
                           class="shadow-sm focus:ring-black focus:border-black block w-full sm:text-sm border-gray-300 rounded"
                           @input.debounce.300ms="handleSearch"
                           placeholder="输入关键字搜索">
                </div>
                <div x-show="!keyword" id="search-preset" class="mt-8">
                    <div class="flex flex-row items-center mb-3">
                        <i class="iconify w-5 h-5" data-icon="mdi:tag"></i>
                        <span class="ml-2">标签</span>
                    </div>
                    <div class="flex flex-row flex-wrap gap-2">
                        <@tagTag method="list">
                            <#list tags?sort_by('postCount')?reverse as tag>
                                <a href="${tag.fullPath!}"
                                   class="text-sm text-black/80 hover:text-black hover:underline hover:font-medium">
                                    #${tag.name!}（${tag.postCount!}）
                                </a>
                            </#list>
                        </@tagTag>
                    </div>
                </div>
                <div x-show="!searching && posts.length>0" class="transition-all">
                    <template x-for="post in posts">
                        <div class="post animated fadeInDown" style="margin-left: 0;margin-right: 0">
                            <div class="post-title">
                                <h3 class="font-medium">
                                    <a x-bind:href="post.url" x-text="post.title"></a>
                                </h3>
                            </div>
                            <div class="post-content text-black/50 text-sm">
                                <p class="py-2.5" x-text="post.content"></p>
                            </div>
                        </div>
                    </template>
                </div>
                <div x-show="keyword && !searching && posts.length<=0" class="transition-all">
                    <span>没有搜索到相关文章</span>
                </div>
            </div>
            <div class="modal-footer border-t px-[16px] py-[12px]">
            </div>
        </div>
    </div>
</div>
