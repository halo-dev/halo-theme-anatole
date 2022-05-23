<div class="page-top animated fadeInDown">
    <div id="nav"
         class="nav flex overflow-x-auto flex-1 flex-nowrap whitespace-nowrap ml-[30px] mr-4 items-center text-sm gap-6 h-full">
        <@menuTag method="list">
            <#list menus?sort_by('priority') as menu>
                <div class="nav-item inline-flex items-center h-full text-black/70 hover:text-[#4786D6] relative transition-all">
                    <a href="${menu.url!}" target="${menu.target!}">${menu.name!} </a>
                </div>
            </#list>
        </@menuTag>
    </div>
    <div class="information gap-4">
        <div x-on:click="postSearchVisible = true"
             class="rounded-full w-[32px] h-[32px] flex justify-center items-center border hover:bg-gray-600 text-gray-500 hover:text-white transition-all cursor-pointer">
            <i class="iconify w-4 h-4" data-icon="mdi:text-box-search"></i>
        </div>
        <div class="avatar">
            <img src="${settings.icon!'${user.avatar!}'}" alt="Logo"/>
        </div>
    </div>
</div>
