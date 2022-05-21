<#--Post and Sheet Page-->
<#if is_post?? || is_sheet??>

    <#--Code Block Highlighting Plugin-->
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

    <#--Image Enlargement-->
    <script type="text/javascript">
        const imageNodes = document.querySelectorAll('#post-content img');
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
</script>