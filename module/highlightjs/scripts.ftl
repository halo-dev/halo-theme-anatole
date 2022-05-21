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