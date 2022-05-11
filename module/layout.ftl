<#macro layout title>
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>${title!}</title>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
        <meta name="format-detection" content="telephone=no"/>
        <meta name="renderer" content="webkit"/>
        <meta name="theme-color" content="${settings.google_color!'#fff'}"/>
        <meta name="author" content="${user.nickname!}"/>
        <meta name="keywords" content="${meta_keywords!}"/>
        <meta name="description" content="${meta_description!}"/>
        <link rel="alternate" type="application/rss+xml" title="atom 1.0" href="${atom_url!}"/>
        <@global.head />
        <link href="${theme_base!}/dist/style.css" rel="stylesheet">

        <#if is_post?? || is_sheet??>
            <link href="${theme_base!}/source/plugins/prism/themes/prism${settings.code_pretty!''}.css" type="text/css"
                  rel="stylesheet"/>
            <script type="text/javascript" src="${theme_base!}/source/plugins/prism/prism.min.js"></script>
        </#if>
    </head>
    <body>

    <#include "./sidebar.ftl">
    <div class="main">
        <#include "./page-top.ftl">
        <div class="content">
            <#nested />
        </div>
    </div>
    <script type="text/javascript" src="${theme_base!}/dist/main.umd.js"></script>
    <script type="text/javascript">
        const url = location.href;
        let urlstatus = false;
        const menuItems = document.querySelectorAll(".nav li a")
        menuItems.forEach(function (node) {
            if ((url + '/').indexOf(node.getAttribute('href')) > -1 && node.getAttribute('href') !== '/') {
                node.classList.add('current');
                urlstatus = true;
            } else {
                node.classList.remove('current');
            }
        });
        if (!urlstatus) {
            menuItems[0].classList.add('current');
        }

        <#if settings.hitokoto!false>
        const xhr = new XMLHttpRequest();
        xhr.open('get', 'https://v1.hitokoto.cn');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                const data = JSON.parse(xhr.responseText);
                const node = document.getElementById('hitokoto');
                node.innerText = data.hitokoto + "        -「" + data.from + "」";
            }
        };
        xhr.send();
        </#if>
    </script>
    <@global.statistics />
    </body>
    </html>
</#macro>