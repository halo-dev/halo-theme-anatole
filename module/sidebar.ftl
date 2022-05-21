<div class="sidebar animated fadeInDown">
    <div class="logo-title">
        <div class="title">
            <img alt="Logo" class="inline-block"
                 src="<#if blog_logo?? && blog_logo!=''>${blog_logo!}<#else>${user.avatar!}</#if>"
                 style="width:127px;<#if settings.avatar_circle!true>border-radius:50%</#if>"/>
            <h3 class="!mt-2 !mb-0">
                <a href="${blog_url!}" title="${blog_title!}">${blog_title!}</a>
            </h3>
            <div class="description">
                <p class="description-text">${user.description!}</p>
            </div>
        </div>
    </div>
    <#include "social-list.ftl">
    <div class="footer">
        <a target="_blank" href="#">
            <a href="https://www.caicai.me">Designed by CaiCai</a>
            <div class="by_halo">
                <a href="https://halo.run" target="_blank">Proudly published with Halo</a>
            </div>
            <div class="footer_text">
                <@global.footer />
            </div>
        </a>
    </div>
</div>
