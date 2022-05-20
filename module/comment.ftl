<#macro comment post,type>
    <#if !post.disallowComment!false>
        <script src="${theme_base!}/assets/js/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/gh/halo-dev/halo-comment@latest/dist/halo-comment.min.js'}"></script>
        <halo-comment id="${post.id?c}" type="${type}"></halo-comment>
    </#if>
</#macro>