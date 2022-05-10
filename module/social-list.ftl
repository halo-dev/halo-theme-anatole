<ul class="social-links">

    <#if settings.rss!true>
      <li>
        <a target="_blank" href="${atom_url!}" title="RSS">
          <i class="iconify w-4 h-4" data-icon="mdi:rss"></i>
        </a>
      </li>
    </#if>

    <#if settings.twitter??>
      <li>
        <a target="_blank" href="https://twitter.com/${settings.twitter}" title="Twitter"> 
          <i class="iconify w-4 h-4" data-icon="mdi:twitter"></i>
        </a>
      </li>
    </#if>

    <#if settings.facebook??>
      <li>
        <a target="_blank" href="https://www.facebook.com/${settings.facebook}" title="Facebook">
          <i class="iconify w-4 h-4" data-icon="mdi:facebook"></i>
        </a>
      </li>
    </#if>

    <#if settings.instagram??>
      <li>
        <a target="_blank" href="https://www.instagram.com/${settings.instagram}" title="Instagram">
          <i class="iconify w-4 h-4" data-icon="mdi:instagram"></i>
        </a>
      </li>
    </#if>

    <#if settings.dribbble??>
      <li>
        <a target="_blank" href="https://dribbble.com/${settings.dribbble}" title="Dribbble">
          <i class="iconify w-4 h-4" data-icon="mdi:dribbble"></i>
        </a>
      </li>
    </#if>

    <#if settings.weibo??>
      <li>
        <a target="_blank" href="https://weibo.com/${settings.weibo}" title="Sina Weibo">
          <i class="iconify w-4 h-4" data-icon="mdi:sina-weibo"></i>
        </a>
      </li>
    </#if>

    <#if settings.qq??>
      <li>
        <a target="_blank" href="tencent://message/?uin=${settings.qq}&Site=&Menu=yes" title="QQ">
          <i class="iconify w-4 h-4" data-icon="mdi:qqchat"></i>
        </a>
      </li>
    </#if>

    <#if settings.telegram??>
      <li>
        <a target="_blank" href="https://t.me/${settings.telegram}" title="Telegram">
          <i class="iconify w-4 h-4" data-icon="mdi:telegram"></i>
        </a>
      </li>
    </#if>

    <#if settings.email??>
      <li>
        <a target="_blank" href="mailto:${settings.email}" title="Email">
          <i class="iconify w-4 h-4" data-icon="mdi:email"></i>
        </a>
      </li>
    </#if>

    <#if settings.github??>
      <li>
        <a target="_blank" href="https://github.com/${settings.github}" title="GitHub">
          <i class="iconify w-4 h-4" data-icon="mdi:github"></i>
        </a>
      </li>
    </#if>
</ul>
