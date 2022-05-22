<#assign sidebar_width="${settings.sidebar_width!}" />
<style>
    .sidebar {
        width: ${sidebar_width!};
    }

    .page-top {
        width: calc(100% - ${sidebar_width!});
    }

    .content {
        width: calc(100% - ${sidebar_width!});
    }

    <#if settings.sidebar_background?? && settings.sidebar_background!=''>
    .sidebar {
        background: url("${settings.sidebar_background!}") no-repeat center center fixed;
    }
    </#if>
</style>