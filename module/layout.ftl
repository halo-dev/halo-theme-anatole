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
            <link href="${theme_base!}/assets/libs/highlight.js/styles/${settings.highlight_style!'default.min.css'}"
                  rel="stylesheet">
            <script src="${theme_base!}/assets/libs/highlight.js/highlight.min.js"></script>
            <script>
                const extraLanguages = "${settings.highlight_extra_languages!''}".split(",")
                extraLanguages.forEach(function (lang) {
                    loadScript("${theme_base!}/assets/libs/highlight.js/languages/" + lang + ".min.js");
                });
                document.addEventListener('DOMContentLoaded', (event) => {
                    document.querySelectorAll('pre code').forEach((el) => {
                        hljs.highlightElement(el);
                    });
                    console.log("Extra languages: ", extraLanguages)
                    console.log("Loaded languages: ", hljs.listLanguages())
                });

                function loadScript(url) {
                    const script = document.createElement("script");
                    script.type = "text/javascript";
                    script.src = url;
                    document.getElementsByTagName("head")[0].appendChild(script);
                }
            </script>


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

    <#if is_post?? || is_sheet??>
        <script type="text/javascript">
            const imageNodes = document.querySelectorAll('.post-content img');
            imageNodes.forEach(function (node) {
                if (node) {
                    node.dataset.src = node.src;
                }
            })

            lightGallery(document.getElementById('post-content'), {
                selector: 'img',
            })
        </script>
    </#if>
    <@global.statistics />
    </body>
    </html>
</#macro>