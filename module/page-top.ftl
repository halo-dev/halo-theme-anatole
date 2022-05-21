<div class="page-top animated fadeInDown">
    <div class="nav">
        <ul class="!m-0">
            <@menuTag method="list">
                <#list menus?sort_by('priority') as menu>
                    <li>
                        <a href="${menu.url!}" target="${menu.target!}">${menu.name!} </a>
                    </li>
                </#list>
            </@menuTag>
        </ul>
    </div>
    <div class="information gap-4">
        <div x-on:click="postSearchVisible = true" class="rounded-full w-[32px] h-[32px] flex justify-center items-center bg-gray-300 hover:bg-gray-600 text-gray-500 hover:text-white transition-all cursor-pointer">
            <i class="iconify w-4 h-4" data-icon="mdi:text-box-search"></i>
        </div>
        <div class="avatar">
            <img src="${settings.icon!'${user.avatar!}'}" alt="Logo"/>
        </div>
    </div>
</div>
