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
        <script type="text/javascript" src="${theme_base!}/dist/main.umd.js"></script>
        <#if is_post?? || is_sheet??>
            <link href="${theme_base!}/assets/libs/highlight.js/styles/${settings.highlight_style!'default.min.css'}"
                  rel="stylesheet">
            <script src="${theme_base!}/assets/libs/highlight.js/highlight.min.js"></script>
            <link href="${theme_base!}/assets/libs/lightgallery.js/css/lightgallery.min.css" rel="stylesheet">
            <script src="${theme_base!}/assets/libs/lightgallery.js/js/lightgallery.min.js"></script>
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
    
    <#include "./scripts.ftl" />
    <@global.statistics />
    </body>
    </html>
</#macro>