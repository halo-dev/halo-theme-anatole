<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title><@layout.block name="title"></@layout.block></title>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="renderer" content="webkit"/>
    <meta name="author" content="${user.nickname!}"/>
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}"/>
    <link rel="alternate" type="application/rss+xml" title="atom 1.0" href="${atom_url!}"/>
    <@global.head />
    <#include "./styles.ftl" />
    <link href="${theme_base!}/dist/style.css" rel="stylesheet">
    <script type="text/javascript" src="${theme_base!}/assets/js/alpine.min.js" async></script>
    <@layout.block name="head"></@layout.block>
</head>
<body x-data="{ postSearchVisible: false }">

<#include "./sidebar.ftl">
<div class="main">
    <#include "./page-top.ftl">
    <div class="content">
        <@layout.block name="content"></@layout.block>
    </div>
</div>

<#include "./scripts.ftl" />
<@layout.block name="footer"></@layout.block>
<#include "./post-search-modal.ftl">
</body>
</html>
