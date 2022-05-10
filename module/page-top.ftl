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
    <div class="information">
        <div class="avatar">
            <img src="${settings.icon!'${user.avatar!}'}" alt="Logo"/>
        </div>
    </div>
</div>
