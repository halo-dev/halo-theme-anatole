<div class="page-top animated fadeInDown">
  <div class="nav">
      <@menuTag method="list">
          <#list menus?sort_by('priority') as menu>
            <li>
              <a href="${menu.url!}" target="${menu.target!}">${menu.name!} </a>
            </li>
          </#list>
      </@menuTag>
  </div>
  <div class="information">
    <div class="avatar">
      <img src="${settings.icon!'${user.avatar!}'}"/>
    </div>
  </div>
</div>
