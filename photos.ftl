<!DOCTYPE HTML>
<html>
<head>
    <title>图库 - ${blog_title!}</title>
    <meta charset="utf-8" />
    <@global.head />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="${theme_base!}/source/plugins/gallery/css/main.css" />
    <noscript><link rel="stylesheet" href="${theme_base!}/plugins/gallery/css/noscript.css" /></noscript>
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
                        <a class="thumbnail" href="${photo.url}" data-position="left center"><img src="${photo.thumbnail}" alt="${photo.description}" /></a>
                        <h2>${photo.name}</h2>
                        <p>${photo.takeTime!}</p>
                    </article>
                </#list>
            </#if>
        </@photoTag>
    </section>
    <footer id="footer">
        <ul class="copyright">
            <li>&copy; ${blog_title!}.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a>.</li>
        </ul>
    </footer>
</div>
<script src="${theme_base!}/source/js/jquery.min.js"></script>
<script src="${theme_base!}/source/js/skel.min.js"></script>
<script src="${theme_base!}/source/plugins/gallery/js/main.js"></script>
<@global.statistics />
</body>
</html>
