<#include "./module/layout.ftl" />
<@layout title="${sheet.title!} - ${blog_title!}">
  <div class="post-page">
    <div class="post animated fadeInDown">
      <div class="post-title">
        <h3>
          <a>${sheet.title!}</a>
        </h3>
      </div>
      <div class="post-content">
          ${sheet.formatContent!}
      </div>
      <div class="post-footer">
        <div class="meta">
          <div class="info">
            <i class="iconify w-3 h-3" data-icon="mdi:calendar-month-outline"></i>
            <span class="date">${sheet.createTime?string("yyyy-MM-dd")}</span>
            <i class="iconify w-3 h-3" data-icon="mdi:comment-outline"></i>
            <a href="${sheet.fullPath!}#comment_widget">Comments</a>
          </div>
        </div>
      </div>
    </div>
    <div class="share" style="display: inline-flex">
      <div class="evernote">
        <a
          href="javascript:(function(){EN_CLIP_HOST='http://www.evernote.com';try{var%20x=document.createElement('SCRIPT');x.type='text/javascript';x.src=EN_CLIP_HOST+'/public/bookmarkClipper.js?'+(new%20Date().getTime()/100000)document.getElementsByTagName('head')[0].appendChild(x);}catch(e){location.href=EN_CLIP_HOST+'/clip.action?url='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(document.title);}})();"
          ref="nofollow" target="_blank">
          <i class="iconify w-4 h-4" data-icon="mdi:evernote"></i>
        </a>
      </div>
      <div class="weibo">
        <a
          href="javascript:void((function(s,d,e){try{}catch(e){}var f='http://service.weibo.com/share/share.php?',u=d.location.href,p=['url=',e(u),'&title=',e(d.title),'&appkey=2924220432'].join('');function a(){if(!window.open([f,p].join(''),'mb',['toolbar=0,status=0,resizable=1,width=620,height=450,left=',(s.width-620)/2,',top=',(s.height-450)/2].join('')))u.href=[f,p].join('');}if(/Firefox/.test(navigator.userAgent)){setTimeout(a,0)}else{a()}})(screen,document,encodeURIComponent));">
          <i class="iconify w-4 h-4" data-icon="mdi:sina-weibo"></i>
        </a>
      </div>
      <div class="twitter">
        <a href="http://twitter.com/home?status=${sheet.fullPath!},${blog_title!},${sheet.title!};">
          <i class="iconify w-4 h-4" data-icon="mdi:twitter"></i>
        </a>
      </div>
    </div>
    <div id="comment_widget" style="margin: 30px;">
        <#include "module/comment.ftl">
        <@comment post=sheet type="sheet" />
    </div>
  </div>
</@layout>