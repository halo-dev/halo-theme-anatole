<script>
    (async function () {
        const extraLanguages = "${settings.highlight_extra_languages!''}".split(",").filter(x => x);

        for (let i = 0; i < extraLanguages.length; i++) {
            const lang = extraLanguages[i];
            if (lang) {
                await loadScript("${theme_base!}/assets/libs/highlight.js/languages/" + lang + ".min.js");
            }
        }

        console.log("Extra languages: ", extraLanguages);

        document.querySelectorAll('pre code').forEach((el) => {
            hljs.highlightElement(el);
        });
        console.log("Loaded languages: ", hljs.listLanguages())
    })()

    function loadScript(url) {
        return new Promise(function (resolve, reject) {
            const script = document.createElement('script');
            script.type = "text/javascript";
            script.src = url;
            script.onload = resolve;
            script.onerror = reject;
            document.head.appendChild(script);
        });
    }

</script>