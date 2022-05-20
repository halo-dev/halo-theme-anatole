<!DOCTYPE HTML>
<html lang="zh">
<head>
    <title>图库 - ${blog_title!}</title>
    <meta charset="utf-8"/>
    <@global.head />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="${theme_base!}/assets/libs/gallery/css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="${theme_base!}/libs/gallery/css/noscript.css"/>
    </noscript>
</head>
<body class="is-loading-0 is-loading-1 is-loading-2">
<div id="main">
    <header id="header">
        <h1>图库</h1>
        <p>${user.description!}</p>
    </header>
    <section id="thumbnails">
        <@photoTag method="list">
            <#if photos?size gt 0>
                <#list photos as photo>
                    <article>
                        <a class="thumbnail" href="${photo.url}" data-position="left center"><img
                                    src="${photo.thumbnail}" alt="${photo.description}"/></a>
                        <h2>${photo.name}</h2>
                        <p>${photo.takeTime!}</p>
                    </article>
                </#list>
            </#if>
        </@photoTag>
    </section>
    <footer id="footer">
        <ul class="copyright">
            <li>&copy; ${blog_title!}.</li>
            <li>Design: <a href="https://html5up.net">HTML5 UP</a>.</li>
        </ul>
    </footer>
</div>
<script src="${theme_base!}/assets/js/jquery.min.js"></script>
<script src="${theme_base!}/assets/js/skel.min.js"></script>
<script src="${theme_base!}/assets/libs/gallery/js/main.js"></script>
<@global.statistics />
</body>
</html>
