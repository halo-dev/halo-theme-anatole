<#include "./module/layout.ftl" />
<@layout title="${post.title!} - ${blog_title!}">
  <div class="post-page">
    <div class="post animated fadeInDown">
      <div class="post-title">
        <h3>
          <a>${post.title}</a>
        </h3>
      </div>
      <div class="post-content">
          ${post.formatContent!}
      </div>
      <div class="post-footer">
        <div class="meta">
          <div class="info">
            <i class="iconify w-3 h-3" data-icon="mdi:calendar-month-outline"></i>
            <span class="date">${post.createTime?string("yyyy-MM-dd")}</span>
            <i class="iconify w-3 h-3" data-icon="mdi:comment-outline"></i>
            <a href="${post.fullPath!}#comment_widget">Comments</a>
              <#if tags?size gt 0>
                <i class="iconify w-3 h-3" data-icon="mdi:tag"></i>
                  <#list tags as tag>
                    <a href="${tag.fullPath!}" class="tag">&nbsp;${tag.name}</a>
                  </#list>
              </#if>
          </div>
        </div>
      </div>
    </div>
    <div class="share" style="display: inline-flex">
      <div class="evernote">
        <a
          href="javascript:(function(){EN_CLIP_HOST='https://www.evernote.com';try{var%20x=document.createElement('SCRIPT');x.type='text/javascript';x.src=EN_CLIP_HOST+'/public/bookmarkClipper.js?'+(new%20Date().getTime()/100000)document.getElementsByTagName('head')[0].appendChild(x);}catch(e){location.href=EN_CLIP_HOST+'/clip.action?url='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(document.title);}})();" target="_blank">
          <i class="iconify w-4 h-4" data-icon="mdi:evernote"></i>
        </a>
      </div>
      <div class="weibo">
        <a
          href="javascript:void((function(s,d,e){try{}catch(e){}var f='https://service.weibo.com/share/share.php?',u=d.location.href,p=['url=',e(u),'&title=',e(d.title),'&appkey=2924220432'].join('');function a(){if(!window.open([f,p].join(''),'mb',['toolbar=0,status=0,resizable=1,width=620,height=450,left=',(s.width-620)/2,',top=',(s.height-450)/2].join('')))u.href=[f,p].join('');}if(/Firefox/.test(navigator.userAgent)){setTimeout(a,0)}else{a()}})(screen,document,encodeURIComponent));">
          <i class="iconify w-4 h-4" data-icon="mdi:sina-weibo"></i>
        </a>
      </div>
      <div class="twitter">
        <a href="https://twitter.com/home?status=${post.fullPath!},${blog_title!},${post.title};">
          <i class="iconify w-4 h-4" data-icon="mdi:twitter"></i>
        </a>
      </div>
    </div>
    <div class="pagination">
      <ul class="clearfix">
          <#if nextPost??>
            <li class="next">
              <a class="btn" role="navigation" href="${nextPost.fullPath!}" title="${nextPost.title}">下一篇</a>
            </li>
          </#if>
          <#if prevPost??>
            <li class="pre">
              <a class="btn" role="navigation" href="${prevPost.fullPath!}" title="${prevPost.title}">上一篇</a>
            </li>
          </#if>
      </ul>
    </div>
    <div id="comment_widget" style="margin: 30px;">
        <#include "module/comment.ftl">
        <@comment post=post type="post" />
    </div>
  </div>
</@layout>